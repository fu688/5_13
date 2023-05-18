//
//  main.m
//  NSDictionarry
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
#import "NSDictionary+print.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[FKUser alloc] initWithName:@"sun" pass:@"123"], @"one",
                              [[FKUser alloc] initWithName:@"bai" pass:@"345"], @"two",
                              [[FKUser alloc] initWithName:@"zhu" pass:@"654"], @"three",
                              [[FKUser alloc] initWithName:@"tang" pass:@"178"],@"four",
                              [[FKUser alloc] initWithName:@"niu" pass:@"155"], @"five", nil];
        [dict print];
        NSLog(@"dictb包含%ld个key-value对", [dict count]);
        NSLog(@"dict的所有key为%@", [dict allKeys]);
        NSLog(@"<FKUser[name = sun, pass = 123]>对应的所有key为%@", [dict allKeysForObject:[[FKUser alloc] initWithName:@"sun" pass:@"123"]]);
        //获取遍历dict所有Value的枚举器
        NSEnumerator* en = [dict objectEnumerator];
        NSObject* Value;
        //用枚举器来遍历dict中所有的value
        while (Value = [en nextObject]) {
            NSLog(@"%@", Value);
        }
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
            NSLog(@"key的值为：%@", key);
            [value say:@"123"];
        }];
    }
    return 0;
}
