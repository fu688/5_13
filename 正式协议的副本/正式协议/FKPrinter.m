//
//  FKPrinter.m
//  正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import "FKPrinter.h"
#define MAXLINE 10
@implementation FKPrinter
{
    NSString* printDate[MAXLINE]; //需要缓存的打印数据
    int dateNum; //需要打印的作业数
    
}
//实现了FKPintable协议和他两个父协议的方法，
- (void)output {
    while (dateNum > 0) {
        NSLog(@"打印机使用%@打印；%@", self.printColor, printDate[0]);
        dateNum--;
        for (int i = 0; i < dateNum; i++) {
            printDate[i] = printDate[i + 1];
        }
    }
}
- (void)addDate:(NSString*) msg {
    if (dateNum > MAXLINE) {
        NSLog(@"输出队列已满，添加失败");
    } else {
        printDate[dateNum++] = msg;
    }
    
}
- (NSString*) printColor {
    return @"red";
}
- (NSDate*) getProduceTime {
    return [[NSDate alloc] init];
}
@end
