//
//  FKItem.m
//  调用私有方法
//
//  Created by 付闯 on 2023/5/4.
//

#import "FKItem.h"

@implementation FKItem
- (void)info{
    NSLog(@"fuchuang");
}
- (double)Discount: (double) discount{
    return self.price * discount;
}
@end
