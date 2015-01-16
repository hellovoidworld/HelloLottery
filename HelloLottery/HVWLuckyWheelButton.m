//
//  HVWLuckyWheelButton.m
//  LotteryLuckyWheel
//
//  Created by hellovoidworld on 15/1/16.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWLuckyWheelButton.h"

@implementation HVWLuckyWheelButton

/** 按钮前景图image的位置尺寸初始化 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat width = 40;
    CGFloat height = 47;
    
    // 这里一定要用contentRect来取得按钮的尺寸，不能使用self.frame
    CGFloat x = (contentRect.size.width - width)/2;
    
    CGFloat y = 30;
    return CGRectMake(x, y, width, height);
}

/** 取消选中效果 */
- (void)setHighlighted:(BOOL)highlighted {
    // 置空
}

@end
