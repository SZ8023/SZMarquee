//
//  NoticeTableViewCell.m
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/17.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "NoticeTableViewCell.h"

@interface NoticeTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *typeLBL;
@property (weak, nonatomic) IBOutlet UILabel *contentLBL;

@end

@implementation NoticeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userInteractionEnabled = YES;
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    self.typeLBL.layer.borderWidth = 0.5;
    self.typeLBL.layer.cornerRadius = 2.5;
    self.typeLBL.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)setItem:(NoticeItem *)item {
    _item = item;
    self.typeLBL.text = item.type;
    self.contentLBL.text = item.content;
}

@end
