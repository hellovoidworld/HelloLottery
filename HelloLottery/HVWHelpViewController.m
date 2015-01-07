//
//  HVWHelpViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWHelpViewController.h"
#import "HVWHtml.h"
#import "HVWArrowSettingItem.h"
#import "HVWSettingGroup.h"
#import "HVWHtmlViewController.h"
#import "HVWNavigationController.h"

@interface HVWHelpViewController ()

/** html数据 */
@property(nonatomic, strong) NSArray *htmls;

@end

@implementation HVWHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 配置html数据
    // 1.创建item
    NSMutableArray *items = [NSMutableArray array];
    for (HVWHtml *html in self.htmls) {
        HVWSettingItem *item = [HVWArrowSettingItem itemWithTitle:html.title destinationViewControllerClass:nil];
        [items addObject:item];
    }
    
    // 2.创建group
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = items;
    
    // 3.配置到tableView
    [self.data addObject:group];
}

/** 加载数据 */
- (NSArray *)htmls {
    if (nil == _htmls) {
        // 1.读取json
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 2.解析json
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        // 3.字典转模型
        NSMutableArray *htmlArray = [NSMutableArray array];
        for(NSDictionary *dict in jsonArray) {
            HVWHtml *html = [HVWHtml htmlWithDictionary:dict];
            [htmlArray addObject:html];
        }
        _htmls = htmlArray;
        
    }
    return _htmls;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 代理方法
/** cell点击跳转 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HVWHtmlViewController *htmlViewController = [[HVWHtmlViewController alloc] init];
    htmlViewController.html = self.htmls[indexPath.row];
    
    /** 为了实现向上弹出效果，不使用push，而是用modal (present**);
     *  使用NaviationController是为了配置一个头部导航栏
     */
    HVWNavigationController *nv = [[HVWNavigationController alloc] initWithRootViewController:htmlViewController];
    [self.navigationController presentViewController:nv animated:YES completion:nil];
}

@end
