//
//  TestNSOperation.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/25.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestNSOperation.h"
#import "MyOperation.h"

@implementation TestNSOperation

+ (void)test {
    
//    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(opFunc) object:nil];
//
//    [op start];
//
//    NSBlockOperation *blockOp = [[NSBlockOperation alloc] init];
//    [blockOp addExecutionBlock:^{
//        NSLog(@"block1 ... %@", [NSThread currentThread]);
//    }];
//    [blockOp addExecutionBlock:^{
//        NSLog(@"block2 ... %@", [NSThread currentThread]);
//    }];
//    [blockOp addExecutionBlock:^{
//        NSLog(@"block3 ... %@", [NSThread currentThread]);
//    }];
//    [blockOp addExecutionBlock:^{
//        NSLog(@"block4 ... %@", [NSThread currentThread]);
//    }];
//    [blockOp addExecutionBlock:^{
//        NSLog(@"block5 ... %@ \n\n\n\n\n", [NSThread currentThread]);
//    }];
//    [blockOp start];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 5;  // 最大并发数量  1表示串行  >1表示并行
    
    NSBlockOperation *block0 = [[NSBlockOperation alloc] init];
    block0.queuePriority = NSOperationQueuePriorityLow;
    [block0 addExecutionBlock:^{
        NSLog(@"queue block0 ... low");
    }];
    
    NSBlockOperation *block1 = [[NSBlockOperation alloc] init];
    block1.queuePriority = NSOperationQueuePriorityNormal;
    [block1 addExecutionBlock:^{
        NSLog(@"queue block1 ... normal");
    }];
    [queue addOperation:block0];
    [queue addOperation:block1];
    
    
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(opFunc) object:nil];
    op1.queuePriority = NSOperationQueuePriorityHigh;
    [queue addOperation:op1];
    
    MyOperation *myOp = [MyOperation new];
    myOp.queuePriority = NSOperationQueuePriorityVeryHigh;
    [queue addOperation:myOp];
    
    
    // 设置依赖关系
   // [myOp addDependency:op1];
    
}

+ (void)opFunc {
    NSLog(@"NSInvocationOperation ... very high");
}

@end
