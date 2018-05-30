//
//  TestGCD.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/25.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestGCD.h"

@implementation TestGCD

+ (void)test {
    
   // dispatch_queue_t myqueue = dispatch_queue_create("my queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        NSLog(@"第一个block");
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个block");
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个block");
    });
    
    // after
    dispatch_after(2, queue, ^{
        NSLog(@"延后2秒执行的block");
    });
    
    // barrier
    dispatch_barrier_sync(queue, ^{
        NSLog(@"-----------> barrier block");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"第4个block");
    });
    dispatch_sync(queue, ^{
        NSLog(@"第5个block");
    });
    dispatch_sync(queue, ^{
        NSLog(@"第6个block");
    });
    
    // group
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSLog(@"grouped block1");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"grouped block2");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"grouped block3");
    });
    
    dispatch_sync(queue, ^{
        dispatch_group_enter(group);
        NSLog(@"grouped block4");
        dispatch_group_leave(group);
    });
    
    dispatch_sync(queue, ^{
        dispatch_group_enter(group);
        NSLog(@"grouped block5");
        dispatch_group_leave(group);
    });
    
    dispatch_sync(queue, ^{
        dispatch_group_enter(group);
        NSLog(@"grouped block6");
        dispatch_group_leave(group);
    });
    
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"--------> group 执行完");
    });
    
    
}


+ (void)testBarrier {
    // 测试发现global queue barrier不起作用， 只有自己创建的concurrent queue有效
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     [self barrier:queue];
    
    dispatch_queue_t que = dispatch_queue_create("my queue", DISPATCH_QUEUE_CONCURRENT);
    [self barrier:que];
}

+ (void)barrier:(dispatch_queue_t)queue {
    dispatch_async(queue, ^{
        NSLog(@"... begin");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 1");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 2");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"... 3");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 4");
    });
    
    dispatch_async(queue, ^{
        sleep(5.f);
        NSLog(@"... 5");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 6");
    });
    
    // barrier
    dispatch_barrier_async(queue, ^{
        NSLog(@"-----------> barrier");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"... 7");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 8");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 9");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 10");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 11");
    });
    dispatch_async(queue, ^{
        NSLog(@"... 12");
    });
    dispatch_async(queue, ^{
        NSLog(@"... end");
    });
}

@end
