//
//  main.m
//  重写isEqual
//
//  Created by 付闯 on 2023/5/3.
//

#import <Foundation/Foundation.h>
#import "User.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User* p1 = [[User alloc] initWithName:@"fu" idstr:@"fu135453"];
        User* p2 = [[User alloc] initWithName:@"fuchuang" idstr:@"fu135453"];
        User* p3 = [[User alloc] initWithName:@"付闯" idstr:@"Fu135453"];
        NSLog(@"p1和p2是否相等？%d", [p1 isEqual: p2]);//输出1
        NSLog(@"p1和p2是否相等？%d", [p1 isEqual: p3]);//输出0
        
    }
    return 0;
}
