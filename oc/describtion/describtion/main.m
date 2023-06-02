//
//  main.m
//  describtion
//
//  Created by 付闯 on 2023/5/15.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:
                              [[FKUser alloc] initWithName:@"sun"], //pass:@"123"],
                          [[FKUser alloc] initWithName:@"bai"], //pass:@"345"],
                          [[FKUser alloc] initWithName:@"zhu"], //pass:@"654"],
                          [[FKUser alloc] initWithName:@"tang"], //pass:@"178"],
                          [[FKUser alloc] initWithName:@"niu"],nil]; //pass:@"155"],nil];
        for (id obj in array) {
            NSLog(@"%@", [obj description] );
        }
        NSMutableArray* array1 = [NSMutableArray arrayWithObjects:@"孙悟空", @"宝玉", @"黛玉",  nil];
        for (id object in array1) {
            NSLog(@"%@", [object description]);
        }
    }
    return 0;
}
