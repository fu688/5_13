//
//  Timer.h
//  定时器
//
//  Created by 付闯 on 2023/5/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Timer : NSObject
@property (nonatomic, assign) int count;
- (void)timerAction:(NSTimer*) timer;
@end

NS_ASSUME_NONNULL_END
