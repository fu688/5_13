//
//  main.m
//  定时器
//
//  Created by 付闯 on 2023/5/11.
//

#import <Foundation/Foundation.h>
#import "Timer.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Timer* mytimer = [[Timer alloc] init];
        mytimer.count = 1;
        NSTimer* _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:mytimer
                selector:@selector(timerAction:) userInfo:@"1" repeats:YES];
        NSRunLoop* loop = [NSRunLoop currentRunLoop];
        [loop run];
    }
    return 0;
}
