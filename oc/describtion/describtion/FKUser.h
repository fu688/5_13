//
//  FKUser.h
//  describtion
//
//  Created by 付闯 on 2023/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKUser : NSObject
@property (nonatomic, copy) NSString* name;
//@property (nonatomic, copy) NSString* pass;
- (id)initWithName:(NSString *)aName; //pass:(NSString*) aPass;
@end
NS_ASSUME_NONNULL_END
