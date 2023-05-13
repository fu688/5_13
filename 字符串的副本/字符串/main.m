//
//  main.m
//  字符串
//
//  Created by 付闯 on 2023/5/9.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        unichar data[6]  = {97, 98, 99, 100, 101, 102};
        //使用Unicode数值数组初始化字符串
        NSString* str = [[NSString alloc] initWithCharacters: data length: 6];
        NSLog(@"%@", str);//打印数值ASCLL对应的字母
        char* str1 = "fuchuang";
        //将C语言的字符串转化为NSString对象
        NSString* Str1 = [NSString stringWithUTF8String:str1];
        NSLog(@"%@", Str1);
        //将字符串写入指定文件
        [Str1 writeToFile:@"myfile. txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSString* str2 = [NSString stringWithContentsOfFile:@"NSStringTest.m" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@", str2);
        
        
        //NSString的常用功能
        //创建字符串的三种方式
        //NSString* str3 = @"fu";
        //NSString* str3 = [NSString stringWithFormat:@"fu"];
        NSString* str3 = [[NSString alloc] initWithFormat:@"fu"];
        NSString* str4  = @"66666";
        //在str3后面追加固定字符串
        //原来的字符串对象并不改变新生成的字符串重新赋给str指针变量
        str3 = [str3 stringByAppendingString:@"chuang"];
        NSLog(@"%@", str3);
        //获取字符串对应的C风格字符串
        const char* str5 = [str3 UTF8String];
        NSLog(@"获取后的C语言字符串：%s", str5);
        str3 = [str3 stringByAppendingFormat:@"19 %@", str4];
        NSLog(@"%@", str3);
        NSLog(@"str3的字符个数为%lu", [str3 length]);
        NSLog(@"str3按UFT-8字符集解码后字节数为：%lu", [str3 lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
        //获取前8个字符组成的字符串
        NSString* s1 = [str3 substringToIndex:8];
        NSLog(@"%@", s1);
        //获取从第10个字符开始到最后的字符串
        NSString* s2 = [str3 substringFromIndex:10];
        NSLog(@"%@", s2);
        //获取从第9个到第10个字符串
        NSString* s3 = [str3 substringWithRange:NSMakeRange(3, 8)];
        NSLog(@"%@", s3);
        //获取19在str3的位置
        NSRange pos = [str3 rangeOfString:@"19"];
        NSLog(@"19在str3出现的位置%ld, 长度为%ld", pos.location, pos.length);
        str3 = [str3 uppercaseString];
        NSLog(@"%@", str3);
    }
    return 0;
}

