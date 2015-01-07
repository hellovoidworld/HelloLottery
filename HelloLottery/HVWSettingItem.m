//
//  HVWSettingItem.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWSettingItem.h"

@implementation HVWSettingItem

/** 自定义初始化方法 */
+ (instancetype) itemWithIcon:(NSString *) icon title:(NSString *) title {
    // 注意要使用 self 来进行 alloc、init才能适配子类进行正确的初始化
    HVWSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype) itemWithTitle:(NSString *) title {
    return [self itemWithIcon:nil title:title];
}

@end
