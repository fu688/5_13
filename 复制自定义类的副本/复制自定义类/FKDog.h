//
//  FKDog.h
//  复制自定义类
//
//  Created by 付闯 on 2023/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKDog : NSObject <NSCopying>
@property (nonatomic, strong) NSMutableString* name;
@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END
