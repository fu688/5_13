//
//  main.m
//  isEqual方法
//
//  Created by 付闯 on 2023/5/3.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int it  = 65;
        float fl = 65.0f;
        NSLog(@"65和65.0f是否相等?:%d", (it == fl));
        char ch = 'A';
        NSLog(@"65和‘A'是否相等？：%d", (it == ch));
        NSString* str1 = [NSString stringWithFormat:@"fuchuang"];//如果是英文则储存在常量区地址一样
        NSString* str2 = [NSString stringWithFormat:@"fuchuang"];//如果是中文则储存在堆区地址不一样
        //NSString* S3 = [[NSString alloc] initWithFormat:@"fuchuang"];
        
        NSLog(@"str1的地址:%p, str2的地址：%p，S3的地址：%p", str1, str2, S3);
        NSLog(@"str1和str2是否相等?:%d", (str1 == str2));
        NSLog(@"str1和str2是否相等?:%d", [str1 isEqual:str2]);
        //NSLog(@"%d", [NSDate new] == [NSString new]);
        NSString* s1 = @"iOS";
        NSString* s2 = @"iOS";
        NSLog(@"s1的地:%p, s2的地址：%p", s1, s2);
        NSLog(@"s1和s2是否相等?:%d", (s1 == s2));
        NSLog(@"s1和s2是否相等?:%d", [s1 isEqual:s2]);
        NSString* s3 = [NSString stringWithFormat:@"iOS"];
        NSLog(@"s3的地:%p", s3);
        NSLog(@"s1和s3是否相等?:%d", (s1 == s3));
        NSLog(@"s1和s3是否相等?:%d", [s1 isEqual:s3]);
        
    }
    return 0;
}
