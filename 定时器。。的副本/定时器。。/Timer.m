//
//  TImer.m
//  定时器。。
//
//  Created by 付闯 on 2023/5/15.
//


#import "Timer.h"
@implementation Timer
- (instancetype)init {
    if (self = [super init]) {
        _index = 1;
        [self startMyTimer];
    }
    return self;
}
 
- (void)startMyTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
            target:self//指定以当前对象的info方法作为执行任务
            selector:@selector(timerAction:)
            userInfo:@"娜娜"
            repeats:YES];//
}
 
- (void)stopMyTimer {
    [_timer invalidate];
    NSLog(@"倒计时结束");
}
 
- (void)timerAction:(NSTimer *)timer {
    NSLog(@"%li次",_index);
    _index++;
    NSLog(@"%@",timer.userInfo);
    if (_index > 10) {
        [self stopMyTimer];
    }
}
@end
