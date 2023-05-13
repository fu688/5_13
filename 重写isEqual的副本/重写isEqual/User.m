//
//  User.m
//  重写isEqual
//
//  Created by 付闯 on 2023/5/3.
//

#import "User.h"

@implementation User
@synthesize name = _name;
@synthesize idstr  = _idstr;
- (id)initWithName: (NSString*) name idstr: (NSString*) idstr {
    if (self = [super init]) {
        self.name = name;
        self.idstr = idstr;
    }
    return self;
}//重写isEquel 判断idstr是否相等
- (BOOL)isEqual: (id) other {
    if (self == other) {
        return YES;//自反性
    }
    if (other != nil && [other isMemberOfClass:User.class]) {
        User* target = (User*)other;
        return [self.idstr isEqual: target.idstr];
    }
    return NO;
}
@end
