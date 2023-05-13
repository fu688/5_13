//
//  main.m
//  包装类
//
//  Created by 付闯 on 2023/5/2.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber* num = [NSNumber numberWithInt:20];
        NSNumber* de = [NSNumber numberWithDouble:3.4];
        NSLog(@"%d", [num intValue]);
        NSLog(@"%g", [de doubleValue]);
        NSNumber* ch = [[NSNumber alloc] initWithChar:'J'];
        NSLog(@"%@", ch);
    }
    return 0;
}
