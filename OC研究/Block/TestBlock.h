//
//  TestBlock.h
//  OC研究
//
//  Created by 骆扬 on 2018/5/23.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestBlock : NSObject {
    void(^_block)(NSString *bb);
}
@property (nonatomic, copy) NSString*name;

- (void)initBlock;

@end

@interface OBJ: NSObject {
    
}

@end;
