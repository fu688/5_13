//
//  main.m
//  复制自定义类
//
//  Created by 付闯 on 2023/5/12.
//

#import <Foundation/Foundation.h>
#import "FKDog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKDog* dog1 = [FKDog new];
        dog1.name = [NSMutableString stringWithString:@"dog"];
        dog1.age = 10;
        FKDog* dog2 = [dog1 copy];//无法复制不可变的FKDoge对象
        /*NSLog(@"dog2的名字为：%@", dog2.name);
        NSLog(@"dog2的年龄为：%d", dog2.age);
        //修改dog2的name属性，dog1会改变*/
        [dog2.name replaceCharactersInRange:NSMakeRange(0, 3) withString:@"coco"];
        /*NSLog(@"dog2的名字为：%@", dog2.name);
        //对dog1属性进行重新赋值，dog1不会改变
        //dog2.name = [NSMutableString stringWithString:@"snoopy"];*/
        dog2.age = 20;
        NSLog(@"dog1的名字为：%@", dog1.name);
        NSLog(@"dog1的年龄为：%d", dog1.age);
        NSLog(@"dog2的名字为：%@", dog2.name);
        NSLog(@"dog2的年龄为：%d", dog2.age);
        
    }
    return 0;
}
