//
//  TestBlock.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/23.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "TestBlock.h"

@implementation TestBlock

- (void)initBlock {
    __block OBJ *obj = [OBJ new];
    NSString *bb = @"你好，bb!";
    __block int cc = 33;
    int dd = 55;
    
    __weak typeof(self) weakSelf = self;
    void(^temp)(NSString *bb) = ^(NSString *bbs) {
       // bb = @"切，什么鬼";
        NSLog(@"%@----> %@   dd=%d", bb, obj, dd);
        cc = 55;
        weakSelf.name = @"123";
    };
    _block = temp;
}




@end

@implementation OBJ

@end
