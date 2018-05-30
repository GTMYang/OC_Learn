//
//  TestTimer.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/22.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSTimer+Weak.h"  // 解决NSTimer内存泄漏的问题
#import "TestTimer.h"
#import "WeakWrapper.h"

@interface TestTimer() {
    NSTimer *_timer1;
    NSTimer *_timer2;
    CADisplayLink *_displayLink;
    dispatch_source_t _timer;
}

@end

@implementation TestTimer

- (instancetype)init
{
    self = [super init];
    if (self) {
//         timmer
        __weak typeof(self) weakSelf = self;
        _timer1 = [NSTimer wk_timerWithTimeInterval:3 repeats:YES block:^(NSTimer *timer) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
//            NSLog(@"timer1 ... strongSelf = %@", strongSelf);
            [strongSelf timer1];
        }];
//        _timer1 = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timer1) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer1 forMode:NSDefaultRunLoopMode];

        //_timer2 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer2) userInfo:nil repeats:YES];
        _timer2 = [NSTimer wk_scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer *timer) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
//            NSLog(@"timer2 ...strongSelf = %@", strongSelf);
            [strongSelf timer2];
        }];

//         display link
        WeakWrapper *wapper = [[WeakWrapper alloc] initWith:self];
        _displayLink = [CADisplayLink displayLinkWithTarget:wapper selector:@selector(displayLink)];
        _displayLink.frameInterval = 60; // 3s执行一次
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

        // gcd timer
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC, 0);
       // __weak typeof(self) weakSelf = self;
        dispatch_source_set_event_handler(_timer, ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            static int i = 0;
            NSLog(@"gcd timer excuted %d times %@", i++, strongSelf);
        });
        // 开启定时器
        dispatch_resume(_timer);
    }
    return self;
}

- (void)timer1 {
    static int i = 0;
    NSLog(@"_timer1 excuted %d times", i++);
}

- (void)timer2 {
    static int i = 0;
    NSLog(@"_timer2 excuted %d times", i++);
}

- (void)displayLink {
    static int i = 0;
    NSLog(@"_displayLink excuted %d times", i++);
}

- (void)invalidateTimers {
    [_timer1 invalidate];
    [_timer2 invalidate];
    
    [_displayLink invalidate];
    
    dispatch_source_cancel(_timer);
    NSLog(@"timer invalidated...");
}


- (void)dealloc
{
    [self invalidateTimers];
    NSLog(@"TimerTest delloced...");
}



@end
