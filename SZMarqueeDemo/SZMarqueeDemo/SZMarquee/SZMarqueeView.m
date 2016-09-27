//
//  SZMarqueeView.m
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/17.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "SZMarqueeView.h"
#import "NoticeTableViewCell.h"

@interface SZMarqueeView()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak) UITableView *tableView;
@property(nonatomic, strong) NSTimer *countDownTimer;
@end

@implementation SZMarqueeView

#pragma mark - Life Cycle

- (void)dealloc {
    [self stopTimer:self.countDownTimer];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setSubviews];
    }
    return self;
}

#pragma mark - Private Method
- (void)setSubviews {
    self.layer.borderWidth = 0.5;
    self.layer.backgroundColor = [[UIColor grayColor] CGColor];
    CGRect tBounds = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 50);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:tBounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 25.0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.allowsMultipleSelection = NO;
    tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:tableView];
    self.tableView = tableView;
}

- (void)start {
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollTableView) userInfo:nil repeats:YES];
    self.countDownTimer = _countDownTimer;
    
}

- (void)scrollTableView {
    UITableViewCell *cell = [[self.tableView visibleCells] lastObject];
    NSIndexPath *tempPath = [self.tableView indexPathForCell:cell];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(tempPath.row + 1)%self.noticeArr.count inSection:tempPath.section];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:indexPath.row];
    
}

/**
 *  关闭定时器
 */
- (void)stopTimer:(NSTimer *)timer {
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

#pragma mark - UITableViewDatasource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.noticeArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *noticeID = @"noticeID";
    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noticeID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NoticeTableViewCell" owner:self options:nil] lastObject];
    }
    cell.item = self.noticeArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.noticeClick) {
        self.noticeClick(indexPath);
    }
}


@end
