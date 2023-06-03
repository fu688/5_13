//
//  Person.m
//  test.2
//
//  Created by 付闯 on 2023/5/26.
//

#import "Person.h"

@implementation Person
@synthesize name;
@synthesize age;
- (id) init {
    if (self = [super init]) {
        self.name = @"fc";
        self.age = 19;
    }
    return self;
}
- (NSString*)description {
    return [NSString stringWithFormat:@"<Person[name = %@, age = %d]>", self.name, self.age];
}
@end
