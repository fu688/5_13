//
//  FKUser.h
//  NSSet判断元素重复的标准
//
//  Created by 付闯 on 2023/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKUser : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* pass;
- (id)initWithName:(NSString *)aName pass:(NSString*) aPass;
- (void)say:(NSString*) content;
@end

NS_ASSUME_NONNULL_END
