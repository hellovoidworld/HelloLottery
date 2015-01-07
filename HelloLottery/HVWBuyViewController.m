//
//  HVWBuyViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/3.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWBuyViewController.h"
#import "TitleExtendButton.h"

@interface HVWBuyViewController ()

@property(nonatomic, weak) UIView *popupView;

/** 标题点击事件 */
- (IBAction)titleClicked:(TitleExtendButton *)sender;

@end

@implementation HVWBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 延迟初始化弹出view
 * （发现放在viewDidLoad的时候，在点击按钮调用的时候pupupView的frame没有被初始化）
 */
- (UIView *)popupView {
    if (_popupView == nil) {
        // 初始化弹出view
        UIView *popupView = [[UIView alloc] init];
        CGFloat popupViewX = 0;
        CGFloat popupViewY = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
        CGFloat popupViewWidth = self.navigationController.navigationBar.frame.size.width;
        CGFloat popupViewHeight = self.view.frame.size.height - popupViewY - self.tabBarController.tabBar.frame.size.height;
        popupView.frame = CGRectMake(popupViewX, popupViewY, popupViewWidth, popupViewHeight);
        popupView.backgroundColor = [UIColor grayColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 100)];
        label.text = @"这是全部彩种de弹出内容";
        [popupView addSubview:label];
        
        self.popupView = popupView;
    }
    
    return _popupView;
}

/** 标题点击事件 
 * 转换箭头方向
 * 伸缩内容
 */
- (IBAction)titleClicked:(TitleExtendButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 按钮旋转
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
    
    // 弹出view
    if (![self.popupView isDescendantOfView:self.view]) {
        [self.view addSubview:self.popupView];
    } else {
        [self.popupView removeFromSuperview];
    }
}
@end
