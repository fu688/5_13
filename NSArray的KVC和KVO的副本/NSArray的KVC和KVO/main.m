//
//  main.m
//  NSArray的KVC和KVO
//
//  Created by 付闯 on 2023/5/14.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
NSString* NSCollectionToString(NSArray* array) {
    NSMutableString* result = [NSMutableString stringWithString:@"["];
    for (id obj in array) {
        [result appendString:[obj description]];
        [result appendString:@", "];
    }
    NSUInteger len = [result length];
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"]"];
    return result;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:
                          [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                          [[FKUser alloc] initWithName:@"bai" pass:@"345"],
                          [[FKUser alloc] initWithName:@"zhu" pass:@"654"],
                          [[FKUser alloc] initWithName:@"tang" pass:@"178"],
                          [[FKUser alloc] initWithName:@"niu" pass:@"155"],nil];
        //将所有集合元素的name属性组成新集合
        id newArr = [array valueForKey:@"name"];
        NSLog(@"%@",  NSCollectionToString(newArr));
        //对集合进行KVC编程
        //将所有集合元素的name属性改为“新名字”
        [array setValue:@"新名字" forKey:@"name"];
        NSLog(@"%@",  NSCollectionToString(array));
    }
    return 0;
}
