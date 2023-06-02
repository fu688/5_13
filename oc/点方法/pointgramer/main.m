//
//  main.m
//  pointgramer
//
//  Created by 付闯 on 2023/5/1.
//

#import <Foundation/Foundation.h>
#import "card.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        card* p = [[card alloc] init];
        p.a = @"fu";
        p.b = @"chuang";
        NSLog(@"卡片的名字为：%@%@", p.a, p.b);
    }
    return 0;
}
