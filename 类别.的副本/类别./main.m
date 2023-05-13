//
//  main.m
//  类别.
//
//  Created by 付闯 on 2023/5/4.
//

#import <Foundation/Foundation.h>
#import "NSNumber+fk.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber* mynum = [NSNumber numberWithInt:3];
        NSNumber* fc = [mynum add:2.4];
        NSLog(@"%f", [fc doubleValue]);
        NSLog(@"%@", fc);
    }
    return 0;
}
