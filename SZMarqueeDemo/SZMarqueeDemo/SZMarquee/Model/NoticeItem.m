//
//  NoticeItem.m
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/17.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "NoticeItem.h"

@implementation NoticeItem

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _type = dict[@"type"];
        _content = dict[@"content"];
    }
    return self;
}

@end
