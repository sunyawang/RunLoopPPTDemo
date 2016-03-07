//
//  ViewController.m
//  RunLoopPPTDemo
//
//  Created by yeven on 16/3/7.
//  Copyright © 2016年 yeven. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)NSTimer *myTimer;
@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)UILabel *myTipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerCallBack:) userInfo:nil repeats:YES];
    
    //增加这行代码，则timer不受滑动tableview影响，没有这行代码则滑动tableview时定时器暂停
//    CFRunLoopAddTimer(CFRunLoopGetCurrent(), (__bridge CFRunLoopTimerRef)_myTimer, kCFRunLoopCommonModes);
    
    _myTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 50, 30)];
    _myTipLabel.backgroundColor = [UIColor grayColor];
    _myTipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_myTipLabel];
    
    _myTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
    _myTable.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_myTable];
}

- (void)timerCallBack:(NSTimer *)timer {
    static int flag = 0;
    _myTipLabel.text = @(flag++).stringValue;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
