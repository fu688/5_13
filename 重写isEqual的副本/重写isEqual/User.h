//
//  User.h
//  重写isEqual
//
//  Created by 付闯 on 2023/5/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* idstr;
- (id)initWithName: (NSString*) name idstr: (NSString*) idstr;
@end

NS_ASSUME_NONNULL_END
