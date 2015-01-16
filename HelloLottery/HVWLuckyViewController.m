//
//  HVWLuckyViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/16.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWLuckyViewController.h"
#import "HVWLuckyWheel.h"

@interface HVWLuckyViewController ()

@end

@implementation HVWLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    // 加载背景
    // 由于是jpg格式，不能使用imageNamed在iameges.xcassets中寻找
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"LuckyBackground" ofType:@"jpg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:imagePath]]];
    
    // 加载转盘
    HVWLuckyWheel *luckyWheel = [HVWLuckyWheel hvwLuckyWheel];
    luckyWheel.center = CGPointMake(self.view.frame.size.width/2, 220);
    [luckyWheel startRotate];
    
    [self.view addSubview:luckyWheel];
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
