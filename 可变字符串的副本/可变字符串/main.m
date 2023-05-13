//
//  main.m
//  可变字符串
//
//  Created by 付闯 on 2023/5/10.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString* str = @"《疯狂iOS讲义》";
        //  创建一个NSMutableString对象
        NSMutableString* str1 = [NSMutableString stringWithString:@"Hello"];
        //追加固定字符串，字符序列发生了改变，因此无须重新赋值，与NSString的区别
        [str1 appendString:@",iOS!"];
        NSLog(@"%@", str1);
        //追加带变量的字符串
        [str1 appendFormat:@"%@是一本很好的书", str];
        NSLog(@"%@", str1);
        //在指定位置插入字符串
        [str1 insertString:@"fkit.org" atIndex:6];
        NSLog(@"%@", str1);
        //删除6到12的字符串
        [str1 deleteCharactersInRange:NSMakeRange(6,12)];
        NSLog(@"%@", str1);
        //替换6到9的字符串
        [str1 replaceCharactersInRange:NSMakeRange(6, 9) withString:@"OC"];
        NSLog(@"%@", str1);
        
    }
    return 0;
}
