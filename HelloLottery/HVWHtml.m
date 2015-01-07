//
//  HVWHtml.m
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWHtml.h"

@implementation HVWHtml

- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    if (self = [super init]) {
        // 由于部分数据不对称，不能使用KVC
        self.title = dictionary[@"title"];
        self.html = dictionary[@"html"];
        self.ID = dictionary[@"id"];
    }
    return self;
}

+ (instancetype) htmlWithDictionary:(NSDictionary *) dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

@end
