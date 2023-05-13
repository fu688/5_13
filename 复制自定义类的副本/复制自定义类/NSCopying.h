//
//  NSCopying.h
//  复制自定义类
//
//  Created by 付闯 on 2023/5/12.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NSCopying <NSObject>
- (id)copyWithZone:(NSZone*)zone
@end

NS_ASSUME_NONNULL_END

