//
//  ClassB.m
//  多态
//
//  Created by 付闯 on 2023/5/2.
//

#import "ClassB.h"

@implementation ClassB
- (void) test
{
    NSLog(@"子类覆盖父类的test方法");
}
- (void) sub
{
    NSLog(@"子类的sub方法");
}
@end
