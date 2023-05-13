//
//  main.m
//  supper访问隐藏变量
//
//  Created by 付闯 on 2023/5/7.
//

#import <Foundation/Foundation.h>
#import "FKSub.h"
#import "FKPreant.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKSub* sub = [[FKSub alloc]init];
        [sub info];
    }
    return 0;
}
