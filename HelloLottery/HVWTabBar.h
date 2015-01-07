//
//  HVWTabBar.h
//  HelloLottery
//
//  Created by hellovoidworld on 14/12/31.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HVWTabBar;

/** 代理协议 */
@protocol HVWTabBarDelegate <NSObject>
@optional
- (void) hvwTabBar:(HVWTabBar *) hvwTabBar didClickedButtonFrom:(int) from to:(int) to;
@end

@interface HVWTabBar : UIView

/** 代理 */
@property(nonatomic, weak) id<HVWTabBarDelegate> delegate;

@end
