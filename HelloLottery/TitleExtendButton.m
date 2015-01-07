//
//  TitleExtendButton.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/3.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Availability.h>
#import "TitleExtendButton.h"

@interface TitleExtendButton()

@property(nonatomic, strong) UIFont *titleFont;

@end

@implementation TitleExtendButton

/** 从文件加载对象就会调用此方法，例如xib和storybard */
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeButton];
    }

    return self;
}

/** 从代码中加载对象就会调用此方法 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeButton];
    }
    
    return self;
}

- (void) initializeButton {
    // 设置font
    self.titleFont = [UIFont systemFontOfSize:14]; // 暂时先自定义font
    self.titleLabel.font = self.titleFont;
    
    // 图标居中
    [self.imageView setContentMode:UIViewContentModeCenter];
}


/** 返回title的frame */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    
    NSDictionary *attr = @{NSFontAttributeName : self.titleFont};
    CGFloat titleWidth;
    
    // 只有 iOS7 版本以上才能运行以下代码
    if (iOS7) {
        // 只有 Xcode5 或以上版本才能识别这段代码
#ifdef __IPHONE_7_0
    titleWidth = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.width;
#else
        titleWidth = [self.currentTitle sizeWithFont:self.titleFont].width;
#endif
    } else { // 否则使用旧的API
        titleWidth = [self.currentTitle sizeWithFont:self.titleFont].width;
    }
    
    CGFloat titleHeight = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

/** 返回image的frame */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageWidth = 30;
    CGFloat imageHeight = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - imageWidth;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

@end
