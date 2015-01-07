//
//  HVWArrowSettingItem.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWArrowSettingItem.h"

@implementation HVWArrowSettingItem

/** 带有目标控制器参数的自定义方法*/
+ (instancetype) itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass {
    
    HVWArrowSettingItem *item = [self itemWithIcon:icon title:title];
    item.destinationViewControllerClass = destinationViewControllerClass;
    return item;
}

+ (instancetype) itemWithTitle:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass {
    
    return [self itemWithIcon:nil title:title destinationViewControllerClass:destinationViewControllerClass];
}

@end
