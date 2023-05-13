//
//  main.m
//  调用私有方法
//
//  Created by 付闯 on 2023/5/4.
//

#import <Foundation/Foundation.h>
#import "FKItem.h"
@interface FKItem (fk)
- (double)Discount: (double) discount;
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKItem* item = [[FKItem alloc] init];
        item.price = 100;
        NSLog(@"物品打折后的价格为%g", [item Discount:0.75]);
    }
    return 0;
}
