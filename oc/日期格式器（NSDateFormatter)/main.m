//
//  main.m
//  日期格式器（NSDateFormatter)
//
//  Created by 付闯 on 2023/5/10.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //需要被格式化的时间
        NSDate* date = [NSDate date];
        //NSDate* date = [NSDate dateWithTimeIntervalSinceNow:3600 * 24];
        //创建两个NSLocales对象，代表中国，美国语言环境
        NSLocale* locales[] = {[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"], [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]};
        //创建8个NSDateFormatter对象
        NSDateFormatter* df[8];
        for (int i = 0; i  < 2; i++) {
            //初始化对象
            df[i * 4] = [[NSDateFormatter alloc] init];
            //应用对象设置要转化成的（NSDateFormatter的df对象）日期和时间风格
            [df[i * 4] setDateStyle:NSDateFormatterShortStyle];
            [df[i* 4] setTimeStyle:NSDateFormatterShortStyle];
            //应用对象设置要转化成的（NSDateFormatter的df对象）语言风格
            [df[i * 4] setLocale:locales[i]];
            df[i * 4 + 1] = [[NSDateFormatter alloc] init];
            [df[i * 4 + 1] setDateStyle:NSDateFormatterMediumStyle];
            [df[i* 4 + 1] setTimeStyle:NSDateFormatterMediumStyle];
            [df[i * 4 + 1] setLocale:locales[i]];
            df[i * 4 + 2] = [[NSDateFormatter alloc] init];
            [df[i * 4 + 2] setDateStyle:NSDateFormatterLongStyle];
            [df[i* 4 + 2] setTimeStyle:NSDateFormatterLongStyle];
            [df[i * 4 + 2] setLocale:locales[i]];
            df[i * 4 + 3] = [[NSDateFormatter alloc] init];
            [df[i * 4 + 3] setDateStyle:NSDateFormatterFullStyle];
            [df[i* 4 + 3] setTimeStyle:NSDateFormatterFullStyle];
            [df[i * 4 + 3] setLocale:locales[i]];
            
        }
        for (int i = 0; i < 2; i++) {
            switch (i) {
                case 0:
                    NSLog(@"---中国日期格式---");
                    break;
                case 1:
                    NSLog(@"---美国日期格式---");
                    break;
            }
            //将NSDate转化为NSString
            NSLog(@"短格式的日期格式：%@", [df[i * 4] stringFromDate:date]);
            NSLog(@"中等格式的日期格式：%@", [df[i * 4 + 1] stringFromDate:date]);
            NSLog(@"长格式的日期格式：%@", [df[i * 4 + 2] stringFromDate:date]);
            NSLog(@"全格式的日期格式：%@", [df[i * 4 + 3] stringFromDate:date]);
        }
        //设置自定义的转化模式
        NSDateFormatter* df2 = [[NSDateFormatter alloc] init];
        [df2 setDateFormat:@"公元yyyy年MM月DD日HH时mm分"];
        NSLog(@"%@", [df2 stringFromDate:date]);
        NSString* str = @"2023-05-10";
        NSDateFormatter* df3 = [[NSDateFormatter alloc] init];
        [df3 setDateFormat:@"yyyy-MM-dd"];
        //将NSString转化为NSDate
        NSDate* date1 = [df3 dateFromString:str];
        NSLog(@"%@", date1);
    }
    return 0;
}
