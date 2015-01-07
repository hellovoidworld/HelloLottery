//
//  HWTabBarController.m
//  HelloLottery
//
//  Created by hellovoidworld on 14/12/31.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "HvWTabBarController.h"
#import "HVWTabBar.h"
#import "HVWTabBarButton.h"

@interface HVWTabBarController () <HVWTabBarDelegate>

@end

@implementation HVWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.添加自定义TabBar
    HVWTabBar *hvwTabBar = [[HVWTabBar alloc] init];
    hvwTabBar.frame = self.tabBar.bounds;
    hvwTabBar.delegate = self;
    
    // 2.设置tabBar
    [self.tabBar addSubview:hvwTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HVWTabBarDelegate 代理方法
- (void)hvwTabBar:(HVWTabBar *)hvwTabBar didClickedButtonFrom:(int)from to:(int)to {
    // 切换子控制器
    self.selectedIndex = to;
}

@end
