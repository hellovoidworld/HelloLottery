//
//  HVWArrowSettingItem.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWSettingItem.h"

@interface HVWArrowSettingItem : HVWSettingItem

/** 跳转目标控制器 */
@property(nonatomic, strong) Class destinationViewControllerClass;

/** 带有目标控制器参数的自定义方法*/
+ (instancetype) itemWithIcon:(NSString *)icon title:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass;

+ (instancetype) itemWithTitle:(NSString *)title destinationViewControllerClass:(Class) destinationViewControllerClass;

@end
