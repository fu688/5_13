//
//  main.m
//  日期与时间
//
//  Created by 付闯 on 2023/5/10.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建NSDate对象的三种方法
        //获取NSDATE对象代表当前日期与时间
        NSDate* date1 = [NSDate date];
        NSLog(@"%@", date1);
        //获取NSDate对象代表从当前时间开始。一天后的日期
        NSDate* date2 = [[NSDate alloc] initWithTimeIntervalSinceNow:3600 * 24];
        NSLog(@"%@", date2);
        //获取NSDate对象代表从当前时间开始。三天前的日期
        NSDate* date3 = [[NSDate alloc] initWithTimeIntervalSinceNow:-3600 * 24];
        NSLog(@"%@", date3);
        //获取从1970年1月1日开始，20年后的日期
        NSDate* date4 = [[NSDate alloc] initWithTimeIntervalSince1970:3600 * 24 * 365 * 20];
        NSLog(@"%@", date4);
        //获取系统当前Locale
        NSLocale* cn = [NSLocale currentLocale];
        NSLog(@"%@", cn);
        //将NSDate的date1转化为Locale对应的大陆简体中文时间
        NSLog(@"%@", [date1 descriptionWithLocale:cn]);
        //获取较早日期
        NSDate* eariler = [date1 earlierDate:date2];
        NSLog(@"%@", eariler);
        //获取较晚日期
        NSDate* later = [date1 laterDate:date2];
        NSLog(@"%@", later);
        switch ([date1 compare:date2])
        {
            case NSOrderedAscending:
                NSLog(@"date1在date2前");
                break;
            case NSOrderedSame:
                NSLog(@"date1与date2相等");
                break;
            case NSOrderedDescending:
                NSLog(@"date1在date2后");
                break;
        }
        NSLog(@"date1与date2相差%g秒",[date1  timeIntervalSinceDate:date2]);
        NSLog(@"date1与现在相差%g秒",[date1  timeIntervalSinceNow]);

    }
    return 0;
}
