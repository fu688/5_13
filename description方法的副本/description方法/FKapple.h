//
//  FKapple.h
//  description方法
//
//  Created by 付闯 on 2023/5/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKapple : NSObject
@ property (nonatomic, copy) NSString* color;
@ property (nonatomic, assign) double weight;
- (id) initWithColor: (NSString*)color weight: (double) weight;
@end
NS_ASSUME_NONNULL_END
