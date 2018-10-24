//
//  NSTimer+SGLUnRetain.m
//  LWTimer
//
//  Created by xinglw on 2018/10/24.
//  Copyright © 2018年 xinglw. All rights reserved.
//

#import "NSTimer+SGLUnRetain.h"

@implementation NSTimer (SGLUnRetain)

+ (NSTimer *)xlw_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{
    
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(xlw_blcokInvoke:) userInfo:block repeats:repeats];
}

+ (void)xlw_blcokInvoke:(NSTimer *)timer {
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
