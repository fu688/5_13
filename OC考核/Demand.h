//
//  Demand.h
//  test.2
//
//  Created by 付闯 on 2023/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Demand <NSObject>
@required//必须实现
- (void) calculate;
@optional//可选择实现
- (void) unnecessary;
@end

NS_ASSUME_NONNULL_END
