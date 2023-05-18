//
//  main.m
//  快速枚举（for...in)
//
//  Created by 付闯 on 2023/5/14.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:
                          [NSNumber numberWithInt:20],
                          [NSNumber numberWithInt:12],
                          [NSNumber numberWithInt:-1],
                          [NSNumber numberWithInt:50],
                          [NSNumber numberWithInt:13],nil];
        for (id object in array) {
            NSLog(@"%@", object);
        }
    }
    return 0;
}
