//
//  main.m
//  ClassAB
//
//  Created by 付闯 on 2023/5/1.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassB* p = [[ClassB alloc] init];
        p.name = @"fuchuang";
        [p info];
    }
    return 0;
}
