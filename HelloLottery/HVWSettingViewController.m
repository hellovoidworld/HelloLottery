//
//  HVWSettingViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWSettingViewController.h"
#import "HVWSettingGroup.h"
#import "HVWArrowSettingItem.h"
#import "HVWSwitchSettingItem.h"
#import "HVWPushNoticeViewController.h"
#import "MBProgressHUD+MJ.h"
#import "HVWProductViewController.h"
#import "HVWHelpViewController.h"
#import "HVWAboutViewController.h"
#import "HVWShareViewController.h"

@interface HVWSettingViewController ()

@end

@implementation HVWSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 设置标题
    self.title = @"设置";

    // 配置数据
    [self setupGroup0];
    [self setupGroup1];
}

- (void) setupGroup0 {
    // 第0组
    HVWSettingItem *pushItem = [HVWArrowSettingItem itemWithIcon:@"MorePush" title:@"推送和提醒" destinationViewControllerClass:[HVWPushNoticeViewController class]];
    HVWSettingItem *shakeItem = [HVWSwitchSettingItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    HVWSettingItem *soundItem = [HVWSwitchSettingItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    HVWSettingItem *assistantItem = [HVWSwitchSettingItem itemWithIcon:@"IDInfo" title:@"购彩小助手"];
    
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[pushItem, shakeItem, soundItem, assistantItem];
    
    [self.data addObject:group];
}

- (void) setupGroup1 {
    // 第1组
    HVWSettingItem *updateCheckItem = [HVWArrowSettingItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    
    // 检查新版本配置一个block，模拟更新过程
    updateCheckItem.runningBlock = ^{
        // 弹窗提示
        [MBProgressHUD showMessage:@"正在使出吃奶的劲儿检查中..."];
        
        // 模拟发送网络请求延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 隐藏消息框
            [MBProgressHUD hideHUD];
            
            // 提醒版本信息
            [MBProgressHUD showError:@"没有发现新版本!"];
        });
    };
    
    HVWSettingItem *checkMailItem = [HVWArrowSettingItem itemWithIcon:@"MoreMessage" title:@"查看邮箱"];
    HVWSettingItem *helpItem = [HVWArrowSettingItem itemWithIcon:@"MoreHelp" title:@"帮助" destinationViewControllerClass:[HVWHelpViewController class]];
    HVWSettingItem *shareItem = [HVWArrowSettingItem itemWithIcon:@"MoreShare" title:@"分享" destinationViewControllerClass:[HVWShareViewController class]];
    HVWSettingItem *productRecommandItem = [HVWArrowSettingItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destinationViewControllerClass:[HVWProductViewController class]];
    HVWSettingItem *aboutItem = [HVWArrowSettingItem itemWithIcon:@"MoreAbout" title:@"关于" destinationViewControllerClass:[HVWAboutViewController class]];
    
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[updateCheckItem, checkMailItem, helpItem, shareItem, productRecommandItem, aboutItem];
    [self.data addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
