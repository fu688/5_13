//
//  main.m
//  自定义类作为key
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
#import "NSDictionary+print.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKUser* u1 = [[FKUser alloc] initWithName:@"bai" pass:@"345"];
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"one",  [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                             @"two", u1,
                             @"three",  [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                             @"four" , [[FKUser alloc] initWithName:@"tang" pass:@"178"],
                             @"five" , [[FKUser alloc] initWithName:@"niu" pass:@"155"], nil];
        u1.pass = nil;
        [dict print];
    }
    return 0;
}
