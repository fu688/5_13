//
//  FKPreant.m
//  supper访问隐藏变量
//
//  Created by 付闯 on 2023/5/7.
//

#import "FKPreant.h"

@implementation FKPreant
@synthesize a = _a;
- (id) init {
    if (self = [super init]) {
        self->_a = 5;
    }
    return self;
}
@end
