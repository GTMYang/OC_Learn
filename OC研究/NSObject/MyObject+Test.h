//
//  MyObject+Test.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/10.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "MyObject.h"

@interface MyObject (Test)
@property (nonatomic, strong) NSString *caTxt;
@property (nonatomic, strong) NSString *dnTxt;
@property (nonatomic, strong) NSString *synTxt;
@property (nonatomic, strong) NSString *assocatedTxt;

- (void)caMethod;
@end
