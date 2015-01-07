//
//  HVWPushNoticeViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWPushNoticeViewController.h"
#import "HVWArrowSettingItem.h"
#import "HVWSettingGroup.h"
#import "HVWLotteryPushViewController.h"

@interface HVWPushNoticeViewController ()

@end

@implementation HVWPushNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 第0组数据
    HVWSettingItem *lotteryPushItem = [HVWArrowSettingItem itemWithTitle:@"开奖推送" destinationViewControllerClass:[HVWLotteryPushViewController class]];
    HVWSettingItem *scorePushItem = [HVWArrowSettingItem itemWithTitle:@"比分直播推送"];
    HVWSettingItem *lotteryAnimationItem = [HVWArrowSettingItem itemWithTitle:@"中奖动画"];
    HVWSettingItem *buyNoticeItem = [HVWArrowSettingItem itemWithTitle:@"购彩提醒"];
    
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[lotteryPushItem, scorePushItem, lotteryAnimationItem, buyNoticeItem];
    [self.data addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
