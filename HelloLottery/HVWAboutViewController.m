//
//  HVWAboutViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/8.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWAboutViewController.h"
#import "HVWArrowSettingItem.h"
#import "HVWSettingGroup.h"

@interface HVWAboutViewController ()

@end

@implementation HVWAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 准备一个webView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:webView];
    
    
    // 配置item和group
    HVWSettingItem *gradeSupport = [HVWArrowSettingItem itemWithTitle:@"评分支持"];
    
    // 跳转到app store进行应用评分
    gradeSupport.runningBlock = ^ {
      // 其实这是网易新闻的app id
        NSString *appid = @"425349261";
        NSString *appStoreAddr = [NSString stringWithFormat:@"http://itunes.apple.com/app/id%@?mt=8", appid];
        NSURL *appStoreURL = [NSURL URLWithString:appStoreAddr];
        [[UIApplication sharedApplication] openURL:appStoreURL];
    };
    
    HVWSettingItem *servicePhone = [HVWArrowSettingItem itemWithTitle:@"客服电话"];
    NSString *phoneNumber = @"020-83568090";
    servicePhone.subTitle = phoneNumber;
    
    servicePhone.runningBlock = ^{
        NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]];
        [webView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    };

    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[gradeSupport, servicePhone];
    [self.data addObject:group];
    
    // header
    // 配置header view
    UINib *nib = [UINib nibWithNibName:@"HVWAboutHeader" bundle:[NSBundle mainBundle]];
    UIView *view = [[nib instantiateWithOwner:nil options:nil] lastObject];
    self.tableView.tableHeaderView  = view;
    self.tableView.tableHeaderView.frame = view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
