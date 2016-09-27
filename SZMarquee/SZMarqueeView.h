//
//  SZMarqueeView.h
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/17.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZMarqueeView : UIView

/** 数据源 */
@property(nonatomic, strong) NSMutableArray *noticeArr;

/** 点击cell所产生的事件 */
@property(nonatomic, copy) void (^noticeClick)(NSIndexPath *indexPath);

/**
 *  开启定时器
 */
-(void)start;


@end
