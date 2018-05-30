//
//  TestMessage.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/21.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestMessage.h"
#import <objc/message.h>

@implementation TestMessage

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    // 最后一个参数说明 https://blog.csdn.net/lgqyhm2010/article/details/14128611
    
    NSString *selName = NSStringFromSelector(sel);
    
    if ([selName isEqualToString:@"nihao"]) {
        class_addMethod(self, sel, cfunc, "v@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

void ifunc(id self, SEL _cmd) {
    NSLog(@"resolveInstanceMethod 新加的Instance方法");
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    
    NSString *selName = NSStringFromSelector(sel);
    
    
    if ([selName isEqualToString:@"classMethod"]) {
        class_addMethod(object_getClass(self), sel, cfunc, "v@:");
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}

void cfunc() {
    NSLog(@"resolveClassMethod 新加的Class方法");
}

#pragma mark - forwardingTargetForSelector

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selName = NSStringFromSelector(aSelector);
    
    if ([selName isEqualToString:@"ffunc"]) {
        return [ForwardingObj new];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}


#pragma mark - forwardInvocation

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *selName = NSStringFromSelector(aSelector);
    
    
    if ([selName isEqualToString:@"fifunc"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSString *selName = NSStringFromSelector(anInvocation.selector);
    if ([selName isEqualToString:@"fifunc"]) {
        [anInvocation invokeWithTarget:[ForwardingObj new]];
        return;
    }
    [super forwardInvocation:anInvocation];
}

@end

@implementation ForwardingObj


- (void)ffunc {
    NSLog(@"ForwardingObj 的ffunc方法");
}

- (void)fifunc {
    NSLog(@"ForwardingObj 的fifunc方法");
}

@end
