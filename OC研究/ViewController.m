//
//  ViewController.m
//  OC研究
//
//  Created by 骆扬 on 2018/5/10.
//  Copyright © 2018年 SyncSoft. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>


int aaaaGTM____c = 0;
void (^testBlock)(NSString *name) = ^ (NSString *name) {
    NSLog(@"%@'s c = %d",name, aaaaGTM____c);
};

#import "MyObject.h"

#import "TestPort.h"
#import "TestBlock.h"
#import "TestProperty.h"

#import "TestGCD.h"
#import "TestNSOperation.h"
#import "TestCoding.h"

#import "NSObject+New.h"

#import "TestTimer.h"



#import "NSObject+ModelTrans.h"
#import "Person1.h"

@interface ViewController () {
    TestTimer *_tester;
}

- (IBAction)doTest:(id)sender;

@end

@implementation ViewController

+ (void)load {
    Method old = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method new = class_getInstanceMethod(self, @selector(viewDidLoad_new));
    method_exchangeImplementations(old, new);
}

- (void)viewDidLoad_new {
    NSLog(@"before viewDidLoad method excute");
    [self viewDidLoad_new];
    NSLog(@"after viewDidLoad method excute");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //TestProperty * tp = [TestProperty new];
    //tp.name2 = @"12121";
   // [tp setValue:@"1212121" forKey:@"name0"];
    
 //   [tp setValue:@"333333" forKeyPath:@"name0"];
    
  //  NSLog(@"%@", tp.name0);
    
   // testBlock(@"xiaoyang");
    
//    TestBlock *tb = [TestBlock new];
//    [tb initBlock];
    
  
    MyObject *obj = [MyObject new];
    obj.ogTxt = @"啥撒谎";
    [obj setValue:@"你好" forKey:@"eogTxt"];
    [obj setValue:@"小GG" forKey:@"exTxt"];
    [obj setValue:@"牛逼" forKey:@"_niubi"];
    NSLog(@"eogTxt = %@, exTxt = %@, _niubi = %@",[obj valueForKey:@"eogTxt"],[obj valueForKey:@"exTxt"],[obj valueForKey:@"_niubi"]);
    //[obj performSelector:@selector(func)];
//    NSObject *obj = [NSObject new];
//    [obj setValue:@"你好" forKey:@"eogTxt"];
//    NSLog(@"eogTxt = %@",[obj valueForKey:@"eogTxt"]);
    _tester = [TestTimer new];
    //sleep(90);
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context
{
    
}


- (IBAction)doTest:(id)sender {
    [TestGCD testBarrier];
}

#pragma mark - Test Methods

- (IBAction)archive:(id)sender {
    TestCoding *tc = [TestCoding new];
    tc.birth = @"1983";
    tc.name = @"骆扬";
    tc.sex = @"男";
    tc.life = [Life new];
    tc.life.age = 35;
    
    NSString *temp = NSTemporaryDirectory();
    NSString *path = [temp stringByAppendingString:@"objc.plist"];
    //    NSHomeDirectory()
    NSLog(@"%@", path);
    [NSKeyedArchiver archiveRootObject:tc toFile:path];
}

- (IBAction)unarchive:(id)sender {
    NSString *temp = NSTemporaryDirectory();
    NSString *path = [temp stringByAppendingString:@"objc.plist"];
    
    TestCoding *tc = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"%@", tc);
}


- (IBAction)modelTransfer:(id)sender {
    NSDictionary *dic = @{@"name": @"落落", @"sex": @"男", @"age": @(18)};
    
    Person1 *p = [Person1 objectWithDic:dic];
    NSLog(@"%@", p);
}

- (IBAction)invalidateTimer:(id)sender {
    _tester = nil;
}


@end
