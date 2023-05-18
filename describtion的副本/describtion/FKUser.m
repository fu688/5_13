//
//  FKUser.m
//  describtion
//
//  Created by 付闯 on 2023/5/15.
//

#import "FKUser.h"

@implementation FKUser
@synthesize name;
//@synthesize pass;
- (id)initWithName:(NSString *)aName { //pass:(NSString*) aPass {
    if (self = [super init]) {
        name = aName;
        //pass = aPass;
    }
    return self;
}
@end
