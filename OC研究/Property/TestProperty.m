//
//  TestProperty.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/24.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestProperty.h"



@implementation TestProperty
//@synthesize name0 = _name0;
@synthesize name1 = _name1;
//@dynamic name2;

- (void)func {
    NSLog(@"sdsd");
}

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

// KVO
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    return NO;
}

@end
