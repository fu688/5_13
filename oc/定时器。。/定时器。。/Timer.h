//
//  TImer.h
//  定时器。。
//
//  Created by 付闯 on 2023/5/15.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject {
    NSInteger _index;
    NSTimer* _timer;
}
-(void) startMyTimer;
-(void) stopMyTimer;
-(void)timerAction: (NSTimer*) timer;
@end
