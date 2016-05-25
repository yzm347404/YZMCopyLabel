//
//  ViewController.m
//  YZMCopyLabel
//
//  Created by 杨振民 on 16/5/18.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import "ViewController.h"
#import "YZMCopyLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    YZMCopyLabel *originalLb = [YZMCopyLabel new];
    originalLb.backgroundColor = [UIColor yellowColor];
    originalLb.frame = CGRectMake(30, 40, 200, 200);
    originalLb.numberOfLines = 0;
    originalLb.text = @"wewe \n 王二强人气人气而去\nwerqrq \n 钱而且热切而去 \n";
    [self.view addSubview:originalLb];
    
    
    YZMCopyLabel *afterLb = [YZMCopyLabel new];
    afterLb.backgroundColor = [UIColor redColor];
    afterLb.numberOfLines = 0;
    afterLb.frame = CGRectMake(30, 300, 200, 200);
    [self.view addSubview:afterLb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
