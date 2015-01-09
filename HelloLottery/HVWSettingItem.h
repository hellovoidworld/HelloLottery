//
//  HVWSettingItem.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RunningBlock)();

/** item基类 */
@interface HVWSettingItem : NSObject

/** 图标 */
@property(nonatomic, copy) NSString *icon;

/** 标题 */
@property(nonatomic, copy) NSString *title;

/** block代码 */
@property(nonatomic, copy) RunningBlock runningBlock;

/** 副标题 */
@property(nonatomic, copy) NSString *subTitle;

+ (instancetype) itemWithIcon:(NSString *) icon title:(NSString *) title;
+ (instancetype) itemWithTitle:(NSString *) title;

@end
