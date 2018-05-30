//
//  MyObject+Test.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/10.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "MyObject+Test.h"

@implementation MyObject (Test)
@dynamic dnTxt;         // @dynamic 指明自己实现getter和setter
//@synthesize synTxt;     // @synthesize 如果没有自己生成getter和setter，编译器帮忙生成

- (void)caMethod {
    NSLog(@"isa category method");
}

@end
