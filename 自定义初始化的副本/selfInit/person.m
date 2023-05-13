//
//  person.m
//  selfInit
//
//  Created by 付闯 on 2023/5/1.
//

#import "person.h"

@implementation person
//@synthesize name = _name;
//@synthesize age = _age;
- (id)init
{
    if (self = [super init]) {
        self->_name = @"付闯";//self->_name = @"付闯“
        self.age = @"19";
    }
    return self;
}
- (id)myinit: (NSString*) name
{
    if (self = [super init]) {
        self. name = name;
    }
    return self;
}
- (id)myinit1:(NSString*) name age:(NSString*) age
{
    if (self = [self myinit: name]) {
        self.age = age;
    }
    return self;
}
@end
