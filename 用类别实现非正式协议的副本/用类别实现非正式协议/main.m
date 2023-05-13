//
//  main.m
//  用类别实现非正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>
#import "NSObject+Eatable.h"
#import "FKApple.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKApple* p = [[FKApple alloc] init];
        [p taste];
    }
    return 0;
}
