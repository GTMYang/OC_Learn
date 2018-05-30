//
//  TestPort.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/23.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestPort : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *ename;

+ (NSThread *)networkRequestThread;

@end
