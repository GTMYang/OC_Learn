//
//  NSObject+NSCoding.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (NSCoding)

- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
