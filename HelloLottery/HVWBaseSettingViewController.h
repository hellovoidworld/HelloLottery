//
//  HVWBaseSettingViewController.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <UIKit/UIKit.h>

/** “设置”界面控制器父类 */
@interface HVWBaseSettingViewController : UITableViewController

/** 存储全部cell的数据 */
@property(nonatomic, strong) NSMutableArray *data;

@end
