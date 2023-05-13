//
//  FKSub.m
//  supper访问隐藏变量
//
//  Created by 付闯 on 2023/5/7.
//

#import "FKSub.h"

@implementation FKSub
{
    int _a;
}
- (id) init {
    if (self = [super init]) {
        self->_a = 7;
    }
    return self;
}
- (void) info {
    NSLog(@"子类_a的成员变量%d", self->_a);
    NSLog(@"父类隐藏的_a成员变量%d", super.a);
}
@end
