//
//  NSObject+NSCoding.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "NSObject+NSCoding.h"
#import <objc/runtime.h>

@implementation NSObject (NSCoding)

- (void)decode:(NSCoder *)aDecoder {
    // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c &&c != [NSObject class]) {
        //解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            //拿到Ivar
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档
            id value = [aDecoder decodeObjectForKey:key];
            // 利用KVC赋值
            [self setValue:value forKey:key];
        }
        free(ivars);
        
        c = [c superclass];
    }
    
}

- (void)encode:(NSCoder *)aCoder {
    // 一层层父类往上查找，对父类的属性执行归解档方法
    Class c = self.class;
    while (c &&c != [NSObject class]) {
        //告诉系统归档的属性是哪些
        unsigned int count = 0;//表示对象的属性个数
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i<count; i++) {
            //拿到Ivar
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);//获取到属性的C字符串名称
            NSString *key = [NSString stringWithUTF8String:name];//转成对应的OC名称
            //归档 -- 利用KVC
            [aCoder encodeObject:[self valueForKey:key] forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

@end
