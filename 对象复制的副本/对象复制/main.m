//
//  main.m
//  对象复制
//
//  Created by 付闯 on 2023/5/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString* book = [NSMutableString stringWithString:@"疯狂iOS讲义"];
        //复制可变副本
        NSMutableString* bookCopy = [book mutableCopy];
        [bookCopy replaceCharactersInRange:NSMakeRange(2, 3) withString:@"Andriod"];
        //原字符串不发生改变
        NSLog(@"book的值为%@",  book);
        NSLog(@"bookcopy的值为%@", bookCopy);
        NSString* str = @"fkit";
        NSMutableString* strcopy = [str mutableCopy];
        [strcopy appendString:@"org"];
        NSLog(@"%@", strcopy);
        //复制不可变副本
        NSMutableString* bookCopy2 = [book copy];//应该为NSString
        //若要修改会发生错误
        //[bookCopy2 appendString:@"fc"];
    }
    return 0;
}
