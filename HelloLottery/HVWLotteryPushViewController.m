//
//  HVWLotteryPushViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/6.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWLotteryPushViewController.h"
#import "HVWSwitchSettingItem.h"
#import "HVWSettingGroup.h"

@interface HVWLotteryPushViewController ()

@end

@implementation HVWLotteryPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 配置数据
    HVWSettingItem *shuangseqiu = [HVWSwitchSettingItem itemWithTitle:@"双色球"];
    HVWSettingItem *daletou = [HVWSwitchSettingItem itemWithTitle:@"大乐透"];
    HVWSettingItem *sand = [HVWSwitchSettingItem itemWithTitle:@"3D"];
    HVWSettingItem *qicaile = [HVWSwitchSettingItem itemWithTitle:@"七乐彩"];
    HVWSettingItem *qixingcai = [HVWSwitchSettingItem itemWithTitle:@"七星彩"];
    HVWSettingItem *pailie3 = [HVWSwitchSettingItem itemWithTitle:@"排列3"];
    HVWSettingItem *pailie5 = [HVWSwitchSettingItem itemWithTitle:@"排列5"];
    HVWSettingGroup *group = [[HVWSettingGroup alloc] init];
    group.items = @[shuangseqiu, daletou, sand, qicaile, qixingcai, pailie3, pailie5];
    [self.data addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
