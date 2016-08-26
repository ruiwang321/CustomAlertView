//
//  ViewController.m
//  alertView
//
//  Created by ruiwang on 16/8/25.
//  Copyright © 2016年 ruiwang. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)alert:(id)sender {

    [CustomAlertView customAlertViewWithTitle:@"警告" message:@"是否删除是否删除是否删除是否删除是否删除？" cancelButtonTitle:@"再想想" confirmButtonTitle:@"确认删除" result:^(BOOL isConfirm) {
            NSLog(@"%@",isConfirm?@"确认":@"取消");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
