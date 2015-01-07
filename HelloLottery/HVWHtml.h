//
//  HVWHtml.h
//  HelloLottery
//
//  Created by hellovoidworld on 15/1/7.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HVWHtml : NSObject

/** 网页标题 */
@property(nonatomic, copy) NSString *title;

/** 网页文件 */
@property(nonatomic, copy) NSString *html;

/** 跳转ID，不能使用id,会和关键字冲突 */
@property(nonatomic, copy) NSString *ID;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;
+ (instancetype) htmlWithDictionary:(NSDictionary *) dictionary;

@end
