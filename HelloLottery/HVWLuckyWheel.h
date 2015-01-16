//
//  HVWLuckyWheel.h
//  LotteryLuckyWheel
//
//  Created by hellovoidworld on 15/1/16.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HVWLuckyWheel : UIView

/** 自定义创建方法 */
+ (instancetype) hvwLuckyWheel;

/** 开启转盘旋转方法 */
- (void) startRotate;

/** 停止转盘旋转方法 */
- (void) stopRotate;

@end
