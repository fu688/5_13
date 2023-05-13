//
//  main.m
//  多态
//
//  Created by 付闯 on 2023/5/2.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA* bc = [[ClassA alloc] init];
        [bc base];
        //[bc test];
        ClassB* sc = [[ClassB alloc] init];
        [sc base];
        [sc test];
        [sc sub];
        ClassA* cd = [[ClassB alloc] init];//只能调用子类中在父类存在的方法
        [cd base];
        //[cd test];//以上两处定义体现了多态
        //[cd sub];
        id sd = cd; //转化为ClassB类型
        [sd sub];
    }
    return 0;
}
