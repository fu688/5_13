//
//  FKUser.m
//  自定义类作为key
//
//  Created by 付闯 on 2023/5/16.
//

#import "FKUser.h"

@implementation FKUser
@synthesize name;
@synthesize pass;
- (id)initWithName:(NSString *)aName pass:(NSString*) aPass {
    if (self = [super init]) {
        name = aName;
        pass = aPass;
    }
    return self;
}
- (void)say:(NSString*) content {
    NSLog(@"%@说%@", self.name, content);
}
//重写isEqual方法 如果FKUser的name.pass相等，即可认为他们相等
- (BOOL)isEqual:(id)other {
    if (self == other) {
        return YES;
    }
    if ([other class] == FKUser.class) {
        FKUser* target  = (FKUser*)other;
        return [self.name isEqualToString:target.name] && [self.pass isEqualToString:target.pass];
    }
    return NO;
}
//重写description方法，可以直接看到FKUser对象的状态
- (NSString*) description {
    return [NSString stringWithFormat:@"<FKUser[name = %@, pass = %@]>", self.name, self.pass];
}
-(NSUInteger) hash {
    NSLog(@"---hash---");
    NSUInteger nameHash = name == nil ? 0 : [name hash];
    NSUInteger passHash = pass == nil ? 0 : [pass hash];
    return nameHash * 31 + passHash;
    
}
- (id)copyWithZone:(NSZone*) zone {
    NSLog(@"---正在复制---");
    FKUser* newUser = [[[self class] allocWithZone:zone] init];
    newUser->name = name;
    newUser->pass = pass;
    return newUser;
}
@end
