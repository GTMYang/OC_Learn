//
//  Person.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "Person1.h"

@implementation Person1


- (NSString *)description
{
    return [NSString stringWithFormat:@"{name: %@, sex: %@, age: %@}", _name, _sex, @(_age)];
}

@end
