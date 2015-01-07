//
//  HVWNavigationController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/1.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWNavigationController.h"


@interface HVWNavigationController ()

@end

@implementation HVWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 类初始化方法，仅调用一次 */
+ (void) initialize {
    // 1.设置导航栏主题
    // 获取能够控制所有NavigationBar的实例
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景图片
    NSString *bgImageName;
    if (iOS7) { // 在HelloLottery-Prefix.pch中定义了判断iOS版本的全局变量
        bgImageName = @"NavBar64";
        navBar.tintColor = [UIColor whiteColor]; // “返回”按钮图标颜色
    } else {
        bgImageName = @"NavBar";
    }
    
    [navBar setBackgroundImage:[UIImage imageNamed:bgImageName] forBarMetrics:UIBarMetricsDefault];
    
    // 设置文本
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attr];
    
    // 2.设置UIBarButtonItem主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文本
    NSMutableDictionary *itemAttr = [NSMutableDictionary dictionary];
    itemAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    itemAttr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:itemAttr forState:UIControlStateNormal];
    
    // 如果是iOS6，使用图片作为按钮背景（iOS7或以上扁平化，直接使用文本）
    if (!iOS7) {
        // 按钮设置背景图片
        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
        // 设置“返回”按钮背景
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
}

// 拦截所有的push操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES; // 这是原来NavigationController中的tabBar，所以要设置自定义的tabBar为Navigation中的tabBar
    [super pushViewController:viewController animated:YES];
}

@end
