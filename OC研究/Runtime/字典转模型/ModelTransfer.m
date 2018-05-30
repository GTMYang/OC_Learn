//
//  ModelTransfer.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "ModelTransfer.h"
#import <objc/runtime.h>

@implementation NSObject(ModelTransfer)
/// 1. class_copyIvarList
/// 2. ivar_getName
/// 3. ivar_getTypeEncoding
- (void)setDict:(NSDictionary *)dict {
    
    Class c = self.class;
    while (c &&c != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 成员变量名转为属性名（去掉下划线 _ ）
            key = [key substringFromIndex:1];
            // 取出字典的值
            id value = dict[key];
            
            // 如果模型属性数量大于字典键值对数理，模型属性会被赋值为nil而报错
            if (value == nil) continue;
            
            // 获得成员变量的类型
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            
            // 如果属性是对象类型
            NSRange range = [type rangeOfString:@"@"];
            if (range.location != NSNotFound) {
                // 那么截取对象的名字（比如@"Dog"，截取为Dog）
                type = [type substringWithRange:NSMakeRange(2, type.length - 3)];
                // 排除系统的对象类型
                if (![type hasPrefix:@"NS"]) {
                    // 将对象名转换为对象的类型，将新的对象字典转模型（递归）
                    Class class = NSClassFromString(type);
                    value = [class objectWithDic:value];
                }
            }
            
            // 将字典中的值设置到模型上
            [self setValue:value forKeyPath:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

+ (instancetype)objectWithDic:(NSDictionary *)dic {
    NSObject *obj = [[self alloc]init];
    [obj setDict:dic];
    return obj;
}


@end

@implementation NSArray(ModelTransfer)

+ (instancetype)objectWithArr:(NSArray *)arr forClass:(Class)cls {
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSObject *value in arr) {
        if ([value isKindOfClass:NSArray.class]) {
            [temp addObject:[cls objectWithArr:(NSArray *)value forClass:cls]];
        } else if ([value isKindOfClass:NSDictionary.class]) {
            [temp addObject:[cls objectWithDic:(NSDictionary *)value]];
        } else {
            return arr;
        }
    }
    
    return [temp copy];
}

@end
