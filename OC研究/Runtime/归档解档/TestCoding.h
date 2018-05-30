//
//  TestCoding.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Life: NSObject<NSCoding>
@property (nonatomic, assign) NSInteger age;

@end

@interface TestCoding : NSObject<NSCoding>
@property (copy, nonatomic) NSString *birth;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *sex;
@property (nonatomic, strong) Life *life;

@end
