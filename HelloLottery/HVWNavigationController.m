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
    // 获取能够控制所有NavigationBar的实例
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景图片
    NSString *bgImageName;
    if (iOS7) { // 在HelloLottery-Prefix.pch中定义了判断iOS版本的全局变量
        bgImageName = @"NavBar64";
    } else {
        bgImageName = @"NavBar";
    }
    
    [navBar setBackgroundImage:[UIImage imageNamed:bgImageName] forBarMetrics:UIBarMetricsDefault];
    
    // 设置文本
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attr];
}

// 拦截所有的push操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES; // 这是原来NavigationController中的tabBar，所以要设置自定义的tabBar为Navigation中的tabBar
    [super pushViewController:viewController animated:YES];
}

@end
