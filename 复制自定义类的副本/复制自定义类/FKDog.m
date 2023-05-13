//
//  FKDog.m
//  复制自定义类
//
//  Created by 付闯 on 2023/5/12.
//

#import "FKDog.h"

@implementation FKDog
@synthesize name;
@synthesize age;
- (id)copyWithZone:(NSZone*)zone {
    NSLog(@"--执行copyWithZone");
    //id obj = [super copy];
    //使用zone参数创建FKDog对象
    FKDog* dog = [[[self class] allocWithZone:zone] init];
    //对name指针再进行复制
    dog.name = [self.name mutableCopy];
    //dog.name = self.name;
    dog.age = self.age;
    return dog;
}
@end
