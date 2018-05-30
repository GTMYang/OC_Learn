//
//  ObjectA.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/18.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@interface ObjectA : NSObject {
    @private
    Person *_person;
}
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSString *personInfo;

@end
