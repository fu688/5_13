//
//  FKoutput.h
//  正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FKoutput <NSObject>
@optional
- (void)output;//该协议的实现类可选择实现output方法
@required
- (void)addDate:(NSString*) msg;//该协议的实现类必须实现output方法
@end

NS_ASSUME_NONNULL_END
