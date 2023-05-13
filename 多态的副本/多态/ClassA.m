//
//  ClassA.m
//  多态
//
//  Created by 付闯 on 2023/5/2.
//

#import "ClassA.h"

@implementation ClassA
- (void) base
{
    NSLog(@"父类的普通base方法");
}
- (void) test
{
    NSLog(@"父类被覆盖的test方法");
}
@end
