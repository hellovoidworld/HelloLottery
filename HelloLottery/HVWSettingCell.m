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

/** 创建“开关”类型的cell */
- (UISwitch *)switchView {
    if (nil == _switchView) {
        _switchView = [[UISwitch alloc] init];
        
        // 监听开关
        [_switchView addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
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
        cell = [[HVWSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
    
    if (self.item.subTitle) {
        self.detailTextLabel.text = self.item.subTitle;
    }
}


/** 设置右部分控件 */
- (void) setupRightView {
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    if ([self.item isKindOfClass:[HVWArrowSettingItem class]]) { // 跳转箭头类型
        
        self.accessoryView = self.arrowView;
        
    } else if ([self.item isKindOfClass:[HVWSwitchSettingItem class]]) { // 开关类型
        
        self.accessoryView = self.switchView;
        self.switchView.on = [self readSwitchStatus];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    } else if ([self.item isKindOfClass:[HVWLabelSettingItem class]]) { // 标签类型
        
        self.accessoryView = self.labelView;
        
    } else {
        self.accessoryView = nil;
    }
}

/** 开关变化事件 
 * 存储开关状态到preferences
 */
- (void) switchChange {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 使用cell的title作为key，开关状态作为value
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    // 立即存储
    [defaults synchronize];
}

/** 读取开关状态 */
- (BOOL) readSwitchStatus {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:self.item.title];
}


@end
