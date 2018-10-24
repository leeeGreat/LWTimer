//
//  ViewController.m
//  LWTimer
//
//  Created by xinglw on 2018/10/23.
//  Copyright © 2018年 xinglw. All rights reserved.
//
#import "LWController.h"
#import "ViewController.h"

#define weakifySelf  \

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn setTitle:@"弹出新的" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
- (void)btnDidClicked:(UIButton *)btn
{
    NSLog(@"%s",__func__);
    LWController *lwcontroller = [[LWController alloc] init];
    [self presentViewController:lwcontroller animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
