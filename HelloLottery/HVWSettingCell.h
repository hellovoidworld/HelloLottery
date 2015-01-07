//
//  HVWSettingCell.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HVWSettingItem;
@interface HVWSettingCell : UITableViewCell

@property(nonatomic, strong) HVWSettingItem *item;

+ (instancetype) cellWithTableView:(UITableView *) tableView;

@end
