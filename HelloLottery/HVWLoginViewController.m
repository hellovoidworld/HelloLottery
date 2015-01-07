//
//  HVWLoginViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/3.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWLoginViewController.h"
#import "UIImage+Extend.h"
#import "HVWSettingViewController.h"

@interface HVWLoginViewController ()

/** 登陆按钮 */
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

/** 点击"设置" */
- (IBAction)settingButtonClicked:(UIBarButtonItem *)sender;

@end

@implementation HVWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *normal = [UIImage resizableImage:@"RedButton"];
    UIImage *highlighted = [UIImage resizableImage:@"RedButtonPressed"];
    
    [self.loginButton setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:highlighted forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 配置”设置“按钮 */
- (void) setupSettingButton {
    
}

/** 点击"设置" */
- (IBAction)settingButtonClicked:(UIBarButtonItem *)sender {
    HVWSettingViewController *settingViewController = [[HVWSettingViewController alloc] init];
    [self.navigationController pushViewController:settingViewController animated:YES];
}
@end
