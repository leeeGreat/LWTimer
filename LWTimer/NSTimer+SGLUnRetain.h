//
//  NSTimer+SGLUnRetain.h
//  LWTimer
//
//  Created by xinglw on 2018/10/24.
//  Copyright © 2018年 xinglw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SGLUnRetain)
+ (NSTimer *)xlw_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                        repeats:(BOOL)repeats
                                          block:(void(^)(NSTimer *timer))block;

@end
