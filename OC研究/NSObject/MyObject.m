//
//  MyObject.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/10.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "MyObject.h"
#import "MyObject+New.h"

// 类扩展（匿名分类）
@interface MyObject(){
    NSInteger *_i; // 可添加成员变量
}
@property(nonnull, strong) NSString *exTxt;  // 可添加属性
- (void)exMethod;       // 可添加方法
@end

@implementation MyObject

- (void)exMethod {
    NSLog(@"isa extend method");

}

@end




@interface MyObject (Cat)
@property (nonatomic, strong) NSString *catTxt;

@end

@implementation MyObject (Cat)

- (void)setCatTxt:(NSString *)catTxt {
    
}
- (NSString *)catTxt {
    return @"catTxt";
}

- (void)catMethod {
    NSLog(@"isa category method");
}

@end
