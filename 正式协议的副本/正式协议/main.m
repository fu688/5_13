//
//  main.m
//  正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>
#import "FKPrinter.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKPrinter* printer = [[FKPrinter alloc] init];
        [printer addDate:@"fu"];
        [printer addDate:@"chuang"];
        [printer output];
        [printer addDate:@"19"];
        [printer addDate:@"666"];
        [printer output];
        //用协议定义变量，那么这些变量只能调用该协议中声明的方法
        //创建一个FKPrinter对象， 当成FKProductable使用
        NSObject<FKProductable>* p = [[FKPrinter alloc] init];
        NSLog(@"%@", p.getProduceTime);
        //创建一个FKPrinter对象， 当成FKOutput使用
        id<FKoutput> s = [[FKPrinter alloc] init];
        [s addDate:@"付闯"];
        [s addDate:@"19"];
        [s output];
    }
    return 0;
}
