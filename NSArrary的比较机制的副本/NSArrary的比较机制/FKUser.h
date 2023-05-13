//
//  FKUser.h
//  NSArrary的比较机制
//
//  Created by 付闯 on 2023/5/13.
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
