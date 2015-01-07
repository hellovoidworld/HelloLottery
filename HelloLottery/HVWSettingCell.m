//
//  HVWSettingCell.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWSettingCell.h"
#import "HVWSettingItem.h"
#import "HVWArrowSettingItem.h"
#import "HVWSwitchSettingItem.h"
#import "HVWLabelSettingItem.h"

@interface HVWSettingCell()

/** 箭头 */
@property(nonatomic, strong) UIImageView *arrowView;

/** 开关 */
@property(nonatomic, strong) UISwitch *switchView;

/** 标签 */
@property(nonatomic, strong) UILabel *labelView;

@end

@implementation HVWSettingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/** 创建右部分子控件 */
- (UIImageView *)arrowView {
    if (nil == _arrowView) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

- (UISwitch *)switchView {
    if (nil == _switchView) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (UILabel *)labelView {
    if (nil == _labelView) {
        _labelView = [[UILabel alloc] init];
        _labelView.frame = CGRectMake(0, 0, 100, self.frame.size.height);
        _labelView.backgroundColor = [UIColor redColor]; // testing
    }
    return _labelView;
}

/** 自定义初始化 */
+ (instancetype) cellWithTableView:(UITableView *) tableView {
    static NSString *ID = @"SettingCell"; // 重用标识
    
    HVWSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (nil == cell) {
        // 创建带有副标题的cell
        cell = [[HVWSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}

/** 加载数据，设置样式 */
- (void)setItem:(HVWSettingItem *)item{
    _item = item;
    
    // 1.设置普通数据
    [self setupNormalData];
    
    // 2.设置右部分控件
    [self setupRightView];
}

/** 设置普通数据 */
- (void) setupNormalData {
    self.textLabel.text = self.item.title;
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
}


/** 设置右部分控件 */
- (void) setupRightView {
    if ([self.item isKindOfClass:[HVWArrowSettingItem class]]) { // 跳转箭头类型
        self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[HVWSwitchSettingItem class]]) { // 开关类型
        self.accessoryView = self.switchView;
    } else if ([self.item isKindOfClass:[HVWLabelSettingItem class]]) { // 标签类型
        self.accessoryView = self.labelView;
    } else {
        self.accessoryView = nil;
    }
}



@end
