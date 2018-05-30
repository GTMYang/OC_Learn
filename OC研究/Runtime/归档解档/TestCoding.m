//
//  TestCoding.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestCoding.h"
#import "NSObject+NSCoding.h"
#import <objc/runtime.h>

@implementation Life
- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        //解档
        [self decode:aDecoder];
    }
    return self;
}
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [self encode:aCoder];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"{age: %@}", @(_age)];
}

@end

@implementation TestCoding


- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        //解档
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [self encode:aCoder];
}

- (NSString *)description
{
//     return [NSString stringWithFormat:@"{name: %@, sex: %@, birth: %@}", _name, _sex, _birth];
    return [NSString stringWithFormat:@"{name: %@, sex: %@, birth: %@, life: %@}", _name, _sex, _birth, _life];
}

@end
