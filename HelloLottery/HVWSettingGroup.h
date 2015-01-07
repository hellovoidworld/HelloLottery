//
//  HVWSettingGroup.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HVWSettingGroup : NSObject

/** 每个group的cell数据 */
@property(nonatomic, strong) NSArray *items;

/** 头部标题 */
@property(nonatomic, copy) NSString *headerTitle;

/** 尾部标题 */
@property(nonatomic, copy) NSString *tailTitle;

@end
