//
//  ModelTransfer.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/28.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(ModelTransfer)

+ (instancetype)objectWithDic:(NSDictionary *)dic;

@end

@interface NSArray(ModelTransfer)

+ (instancetype)objectWithArr:(NSArray *)arr forClass:(Class)cls;
//+ (instancetype)objectWithDicArray:(NSArray *)dicArr;

@end
