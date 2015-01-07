//
//  UIImage+Extend.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/3.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage(Extend)

/**  返回一个中心扩展拉伸的图片 */
+ (UIImage *) resizableImage:(NSString *) imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 这个参数决定了左边的保护区域，右边的保护区域为左边+1开始到末端
    CGFloat width = image.size.width * 0.5;
    
    // 原理同左右保护区域
    CGFloat height = image.size.height * 0.5;
    
    // 也就是，取中间1x1的区域作为扩展区域
    return [image stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

@end
