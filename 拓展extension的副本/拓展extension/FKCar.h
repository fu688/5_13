//
//  FKCar.h
//  拓展extension
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKCar : NSObject
@property (nonatomic, copy) NSString* brand;
@property (nonatomic, copy) NSString* model;
- (void)drive;
@end

NS_ASSUME_NONNULL_END
