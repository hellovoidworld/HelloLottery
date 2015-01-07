//
//  UIImage+Extend.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/3.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage(Extend)

/**  返回一个中心扩展拉伸的图片 */
+ (UIImage *) resizableImage:(NSString *) imageName;

@end
