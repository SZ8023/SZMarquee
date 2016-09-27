//
//  NoticeItem.h
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/17.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoticeItem : NSObject

@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
