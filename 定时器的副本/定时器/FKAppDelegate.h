//
//  FKAppDelegate.h
//  定时器
//
//  Created by 付闯 on 2023/5/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKAppDelegate : NSObject
@property (nonatomic, assign) int count;
- (void)info:(NSTimer*) timer;
- (void)fc;
@end

NS_ASSUME_NONNULL_END
