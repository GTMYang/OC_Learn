//
//  ObserverObj.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/18.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "ObserverObj.h"


@implementation ObserverObj

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"value changed....");
}

@end
