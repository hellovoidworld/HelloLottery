//
//  HVWTabBar.m
//  HelloLottery
//
//  Created by hellovoidworld on 14/12/31.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "HVWTabBar.h"
#import "HVWTabBarButton.h"

#define HVWTabBarButtonCount 5

@interface HVWTabBar()

@property(nonatomic, weak) HVWTabBarButton *selectedButton;

@end

@implementation HVWTabBar

// 重写initWithFrame方法，添加tabBar按钮
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initButtons];
    }
    
    return self;
}

/** 初始化按钮 */
- (void) initButtons {
    for (int i=0; i<HVWTabBarButtonCount; i++) {
        // 3.1创建按钮
        HVWTabBarButton *button = [HVWTabBarButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        // 3.2设置按钮背景图片
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d", i+1]] forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel", i+1]]  forState:UIControlStateSelected];
        
        // 3.3添加到tabBar
        [self addSubview:button];
        
        // 3.4添加监听事件
        [button addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        // 3.5默认已经点击了第一个按钮
        if (i == 0) {
            [self tabBarButtonClicked:button];
        }
    }
}

/** 初始化子控件的位置尺寸 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (int i=0; i<HVWTabBarButtonCount; i++) {
        HVWTabBarButton *button = self.subviews[i];
        CGFloat buttonWidth = self.frame.size.width / 5;
        CGFloat buttonHeight = self.frame.size.height;
        CGFloat buttonX = i * buttonWidth;
        CGFloat buttonY = 0;
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    }
}

- (void) tabBarButtonClicked:(HVWTabBarButton *) button {
    // 1.调用代理方法，通知TabBarController切换子控制器
    if ([self.delegate respondsToSelector:@selector(hvwTabBar:didClickedButtonFrom:to:)]) {
        [self.delegate hvwTabBar:self didClickedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.取消选中之前的按钮
    self.selectedButton.selected = NO;
    
    // 3.选中新点击的按钮
    button.selected = YES;
    
    // 4.设置为当前选中的按钮
    self.selectedButton = button;
}

@end
