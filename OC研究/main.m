//
//  main.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/10.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "ObjectA.h"
#import "ObserverObj.h"
#import <objc/runtime.h>

#import "TestMessage.h"

#import "TestPort.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
//    @autoreleasepool {
//
//        NSArray* arrStr = @[@"english",@"franch",@"chinese"];
//        NSArray* arrCapStr = [arrStr valueForKey:@"capitalizedString"];
//        for (NSString* str  in arrCapStr) {
//            NSLog(@"%@",str);
//        }
//        NSArray* arrCapStrLength = [arrStr valueForKeyPath:@"capitalizedString.length"];
//        for (NSNumber* length  in arrCapStrLength) {
//            NSLog(@"%ld",(long)length.integerValue);
//        }
//
//    }
//    @autoreleasepool {
//        // insert code here...
//
//        //生成对象
//        ObjectA *objA = [[ObjectA alloc] init];
//        ObserverObj*observer = [ObserverObj new];
//
//        // 添加Observer之后
//        [objA addObserver:observer forKeyPath:@"personInfo" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//
//        // 输出ObjectA
//        NSLog(@"%@", [objA class]);
//        // 输出NSKVONotifying_ObjectA（object_getClass方法返回isa指向）
//        NSLog(@"%@", object_getClass(objA));
//
//        objA.personInfo  =@"偶啊#不难";
//        [objA setPersonInfo:@"偶啊#不难"];
//
//    }
    
    // 消息转发
//    @autoreleasepool {
//
//
//        TestMessage *test = [TestMessage new];
//
//        [test performSelector:@selector(nihao)];
//        [test performSelector:@selector(ffunc)];
//        [test performSelector:@selector(fifunc)];
//        [TestMessage performSelector:@selector(classMethod)];
//    }
    
//        @autoreleasepool {
//    
//            [TestPort networkRequestThread];
//        }

    
}
