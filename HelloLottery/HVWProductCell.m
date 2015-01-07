//
//  HVWProductCell.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWProductCell.h"
#import "HVWProduct.h"

@interface HVWProductCell()

/** 产品app图标 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/** 产品app名称 */
@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation HVWProductCell

- (void)awakeFromNib {
    // Initialization code
    self.imageView.layer.cornerRadius = 8; // 设置圆角
    self.imageView.clipsToBounds = YES; // 裁剪超出边界部分
}


- (void)setProduct:(HVWProduct *)product {
    _product = product;
    
    // 设置图标
    NSString *imageName = [product.icon stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    // 设置名称
    self.labelView.text = product.title;
}

@end
