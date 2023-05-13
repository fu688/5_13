//
//  main.m
//  日历(NSCalendar)与日期组件（NSDateComponents)
//
//  Created by 付闯 on 2023/5/11.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //获取表示公历的calendar对象
        NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        //获取当前时间
        NSDate* dt = [NSDate date];
        //定义一个时间字段的旗标，指定将会获取指定年月日时分秒的信息
        unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit;
        //调用NSDCalendar的components:fromDate方法获取NSDate对象中时间字段的数值，该方法返回一个NSDateComponents对象
        NSDateComponents* comp = [gregorian components:unitFlags fromDate:dt];
        //用NSDateComponents对象的getter方法获取个时间段的数值
        NSLog(@"现在是%ld年", comp.year);
        NSLog(@"现在是%ld月", comp.month);
        NSLog(@"现在是%ld日", comp.day);
        NSLog(@"现在是%ld时", comp.hour);
        NSLog(@"现在是%ld分", comp.minute);
        NSLog(@"现在是%ld秒", comp.second);
        NSLog(@"现在是星期%ld", comp.weekday);
        //再创建一个NSDateComponents对象
        NSDateComponents* comp2 = [[NSDateComponents alloc] init];
        //用NSDateComponents对象的setter方法设置个时间段的数值
        comp2.year = 2023;
        comp2.month = 5;
        comp2.day = 11;
        comp2.hour = 20;
        comp2.minute = 50;
        comp2.second = 30;
        //调用NSDCalendar的dateFromComponents恢复NSDate对象，该方法返回一个NSDate对象
        NSDate* date = [gregorian dateFromComponents:comp2];
        NSLog(@"%@", date);
    }
    return 0;
}

