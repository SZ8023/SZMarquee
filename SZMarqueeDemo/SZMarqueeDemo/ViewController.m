//
//  ViewController.m
//  SZMarqueeDemo
//
//  Created by styshy on 16/9/27.
//  Copyright © 2016年 styshy. All rights reserved.
//

#import "ViewController.h"
#import "SZMarqueeView.h"
#import "NoticeItem.h"

@interface ViewController ()

@property(nonatomic, strong) NSMutableArray *dataSource;
@property(nonatomic, weak) SZMarqueeView *nView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SZMarqueeView *nView = [[SZMarqueeView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 50)];
    [self.view addSubview:nView];
    self.nView = nView;
    self.nView.noticeArr = [self.dataSource mutableCopy];
    self.nView.noticeClick = ^(NSIndexPath *indexPath){
        NSLog(@"你点击了 %@",indexPath);
    };
    [self.nView start];
}


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        
        // Data from `data.json`
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"notice" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"touTiao"];
        
        // Convert to `FDFeedEntity`
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[NoticeItem alloc] initWithDictionary:obj]];
        }];
        _dataSource = entities;
        
    }
    
    return _dataSource;
}

@end
