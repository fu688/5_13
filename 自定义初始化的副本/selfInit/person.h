//
//  person.h
//  selfInit
//
//  Created by 付闯 on 2023/5/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface person : NSObject
@property (nonatomic , copy) NSString* name ;
@property (nonatomic , copy) NSString* age ;
- (id) myinit: (NSString*) name;
- (id) myinit1:(NSString*) name age:(NSString*) age;
@end;

NS_ASSUME_NONNULL_END
