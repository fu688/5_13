//
//  main.m
//  selfInit
//
//  Created by 付闯 on 2023/5/1.
//

#import <Foundation/Foundation.h>
#import "person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        person* p = [[person alloc] init];
        NSLog(@"他的名字为：%@，年龄为；%@", p.name, p.age);
        person* p1 = [[person alloc] myinit:@"fuchuang"];
        NSLog(@"他的名字为：%@", p1.name);
        person* p2 = [[person alloc] myinit1:@"fu chuang"age:@"20"];
        NSLog(@"他的名字为：%@，年龄为；%@", p2.name, p2.age);
        
    }
    return 0;
}
