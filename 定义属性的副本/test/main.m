//
//  main.m
//  test
//
//  Created by 付闯 on 2023/4/30.
//

#import <Foundation/Foundation.h>
#import "person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        person* p = [[person alloc] init];
        //[p setName:@"fuchuang"];
        p.name = @"fuchuang";
        [p setPass:@"fu135453"];
        [p setBirth:@"2-14"];
        NSLog(@"他的账户为：%@，密码为：%@，生日：%@", [p name], [p pass], [p birth]);
    }
    return 0;
}
