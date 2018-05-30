//
//  TestProperty.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/24.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestProperty : NSObject {
    NSString *_name0;
}
@property (nonatomic, retain, readonly) NSString* name0;
@property (nonatomic, retain, readwrite) NSString* name1;
@property (nonatomic, retain, readwrite) NSString* name2;


- (void)func;

@end
