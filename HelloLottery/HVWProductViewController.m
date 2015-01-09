//
//  HVWProductViewController.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWProductViewController.h"
#import "HVWProduct.h"
#import "HVWProductCell.h"

@interface HVWProductViewController ()

/** 数据 */
@property(nonatomic, strong) NSArray *products;

@end

@implementation HVWProductViewController

static NSString * const reuseIdentifier = @"HVWProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.Register cell classes 注册cell，要使用哪个CollectionViewCell
    UINib *nib = [UINib nibWithNibName:@"HVWProductCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    // 2.设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 加载JSON数据 */
- (NSArray *)products {
    if (nil == _products) {
        // 1.读取json
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        
        // 2.加载数据
        NSData *data = [NSData dataWithContentsOfFile:jsonPath];
        
        // 3.将json数据转成数组、字典，使用一个json工具类
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 4.字典转模型
        NSMutableArray *productArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HVWProduct *product = [HVWProduct productWithDictionary:dict];
            [productArray addObject:product];
        }
        
        _products = productArray;
    }
    return _products;
}

/** 初始化，配置布局 */
- (instancetype)init {
    // 1.使用流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 2.设置cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    
    // 3.设置cell水平间距
    layout.minimumInteritemSpacing = 0;
    
    // 4.设置cell垂直间距
    layout.minimumLineSpacing = 10;
    
    // 5.设置四周边距
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    // 6.配置布局方式
    return [super initWithCollectionViewLayout:layout];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    // 1.获得cell
    HVWProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 2.配置模型数据
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
/** 选择事件 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HVWProduct *product = self.products[indexPath.item];
    
    NSURL *appUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@", product.urlSchema, product.urlId]];
    NSURL *appStoreUrl = [NSURL URLWithString:product.appStoreUrl];

    UIApplication *application = [UIApplication sharedApplication];
    // 先判断是否存在此app
    if ([application canOpenURL:appUrl]) {
        // 打开app
        [application openURL:appUrl];
    } else {
        // 跳转到app store下载app
        [application openURL:appStoreUrl];
    }
}

@end
