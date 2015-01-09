//
//  HVWProduct.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWProduct.h"

@implementation HVWProduct

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    if (self = [super init]) {
        // 由于模型的成员属性和dictionary中的键值对数量不符，不能使用KVC
        self.icon = dictionary[@"icon"];
        self.title = dictionary[@"title"];
        self.appStoreUrl = dictionary[@"url"];
        self.urlId = dictionary[@"id"];
        self.urlSchema = dictionary[@"customUrl"];
    }
    
    return self;
}

+ (instancetype) productWithDictionary:(NSDictionary *) dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

@end
