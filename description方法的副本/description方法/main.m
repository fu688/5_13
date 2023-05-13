//
//  main.m
//  description方法
//
//  Created by 付闯 on 2023/5/2.
//

#import <Foundation/Foundation.h>
#import "FKapple.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //便利的对象初始化
        FKapple* p = [[FKapple alloc] initWithColor: @"红色" weight: 5.68];
        NSLog(@"%@", p);//打印对象
    }
    return 0;
}
