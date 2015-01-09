//
//  HVWBaseSettingViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWBaseSettingViewController.h"
#import "HVWSettingGroup.h"
#import "HVWSettingItem.h"
#import "HVWSettingCell.h"
#import "HVWArrowSettingItem.h"

@interface HVWBaseSettingViewController ()

@end

@implementation HVWBaseSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 重写初始化方法 
 * 一定要使用group样式
 */
- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

/** 加载空数据 */
- (NSMutableArray *)data {
    if (nil == _data) {
        _data = [NSMutableArray array];
    }
    
    return _data;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HVWSettingGroup *group = self.data[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HVWSettingCell *cell = [HVWSettingCell cellWithTableView:tableView];
    HVWSettingGroup *group = self.data[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.取消选中，不要保持选中状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.1加载点击事件
    HVWSettingGroup *group = self.data[indexPath.section];
    HVWSettingItem *item = group.items[indexPath.row];
    
    // 2.2如果配置有block， 运行block
    if (item.runningBlock) {
        item.runningBlock();
    }
    
    // 2.3配置跳转控制器
    if ([item isKindOfClass:[HVWArrowSettingItem class]]) { // 如果是跳转类型的item
        HVWArrowSettingItem *arrowItem = (HVWArrowSettingItem *) item;

        
        if (nil != arrowItem.destinationViewControllerClass) {
            UIViewController *viewController = [[arrowItem.destinationViewControllerClass alloc] init];
            viewController.title = arrowItem.title;
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
}

/** 组头部 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HVWSettingGroup *group = self.data[section];
    return group.headerTitle;
}


/** 组尾部 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    HVWSettingGroup *group = self.data[section];
    return group.tailTitle;
}

@end
