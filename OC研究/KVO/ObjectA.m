//
//  ObjectA.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/18.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "ObjectA.h"
#import "Person.h"

@implementation ObjectA

- (NSString *)personInfo {
    return [[NSString alloc] initWithFormat:@"%@#%@", [_person name], [_person sex]];
}

- (void)setPersonInfo:(NSString *)personInfo {
    NSArray * array = [personInfo componentsSeparatedByString:@"#"];
    [_person setName:array[0]];
    [_person setSex:array[1]];
}

//+ (NSSet<NSString *> *)keyPathsForValuesAffectingPersonInfo
//{
//    return [NSSet setWithObjects:@"person.name", @"person.sex", nil];
//}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ([key isEqualToString: @"personInfo"]) {
        return [NSSet setWithObjects:@"person.name", @"person.sex", nil];
    }

    return [super keyPathsForValuesAffectingValueForKey:key];
}

@end
