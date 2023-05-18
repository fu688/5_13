//
//  Timer.m
//  定时器
//
//  Created by 付闯 on 2023/5/17.
//

#import "Timer.h"

@implementation Timer
@synthesize count;
- (void)timerAction:(NSTimer *)timer {//该参数代表该任务的定时器
    NSLog(@"正在执行第%d次任务", count++);
    //NSLog(@"%@", timer.userInfo);
    if (count > 10) {
        [timer invalidate];
        NSLog(@"取消执行定时器");
    }
}
@end
