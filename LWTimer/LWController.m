//
//  LWController.m
//  LWTimer
//
//  Created by xinglw on 2018/10/23.
//  Copyright © 2018年 xinglw. All rights reserved.
//
#import "NSTimer+SGLUnRetain.h"
#import "LWController.h"

#define weakifySelf  \
__weak __typeof(&*self)weakSelf = self;

#define strongifySelf \
__strong __typeof(&*weakSelf)self = weakSelf;

@interface LWController ()
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation LWController
{
    int num;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"stop" forState:UIControlStateNormal];
//    btn.frame = CGRectMake(100, 100, 50, 50);
//    btn.backgroundColor = [UIColor blueColor];
//    btn.tag = 100;
//    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"dismiss" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(200, 100, 50, 50);
    btn2.backgroundColor = [UIColor blueColor];
    btn2.tag = 200;
    [btn2 addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    //调用target方法会引引起timer对self或者weakSelf的强引用
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:weakSelf selector:@selector(test) userInfo:nil repeats:YES];
    
    __block NSInteger i = 0;
    __weak typeof(self) weakSelf = self;
//    weakifySelf
    self.timer = [NSTimer xlw_scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
//        strongifySelf
        [weakSelf doSomeThing];
        NSLog(@"----------------");
        
        //下面模仿倒计时结束时调用了 invalidate方法
//        if (i++ > 10) {
//            [timer invalidate];
//        }
    }];
    
    //iOS10之后用系统提供的block初始化方法
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf doSomeThing];
//        NSLog(@"----------------");
//    }];
    
}
- (void)btnDidClicked:(UIButton *)btn
{
    
    NSLog(@"%s",__func__);
    if (btn.tag == 100) {
        [self.timer invalidate];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }

}
- (void)test
{
    NSLog(@"%s",__func__);
//    if (num++==5) {
//        [self.timer invalidate];
//    }
}

- (void)doSomeThing {
    NSLog(@"%s",__func__);
    // doSomeThing
}

- (void)stopDoSomeThing {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc {
    NSLog(@"dealloc");
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
