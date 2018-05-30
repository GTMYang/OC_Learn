//
//  WeakWrapper.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/30.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "WeakWrapper.h"
#import <objc/runtime.h>

@interface WeakWrapper()
@property (nonatomic, weak) id weakObj;
@end

@implementation WeakWrapper

- (instancetype)initWith:(id)willWeak {
    if ([super init]) {
        self.weakObj = willWeak;
    }
    return self;
}

- (instancetype)init {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

// 消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
     return _weakObj;
}

@end

