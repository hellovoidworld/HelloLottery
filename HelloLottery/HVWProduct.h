//
//  HVWProduct.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HVWProduct : NSObject

@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *appStoreUrl;
@property(nonatomic, copy) NSString *urlId;
@property(nonatomic, copy) NSString *urlSchema;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) productWithDictionary:(NSDictionary *) dictionary;

@end
