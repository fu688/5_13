//
//  main.m
//  对NSDictionary的key排序
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+print.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"123", @"one", @"1234", @"tow", @"12", @"three", @"12345", @"four", nil];
        [dict print];
        NSArray* keyarr1 = [dict keysSortedByValueUsingSelector:@selector(compare:)];
        NSLog(@"%@", keyarr1);
        NSArray* keyarr2 = [dict keysSortedByValueUsingComparator:^(id value1, id value2) {
            if ([value1 length] > [value2 length]) {
                return NSOrderedDescending;
            }
            if ([value1 length] < [value2 length]) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }];
        NSLog(@"%@", keyarr2);
        [dict writeToFile:@"mydict.txt" atomically:YES];
    }
    return 0;
}
