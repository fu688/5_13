//
//  FKAppDelegate.m
//  定时器
//
//  Created by 付闯 on 2023/5/11.
//

#import "FKAppDelegate.h"

@implementation FKAppDelegate
@synthesize count;
- (void)info:(NSTimer*) timer {
    NSLog(@"正在执行第%d次任务", self.count++);
    if (self.count > 10) {
        NSLog(@"取消执行定时器");
        [timer invalidate];
    }
}
- (void)fc {
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(info:) userInfo:nil repeats:YES];
}
@end
