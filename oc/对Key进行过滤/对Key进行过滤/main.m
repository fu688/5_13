//
//  main.m
//  对Key进行过滤
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:89], @"12",[NSNumber numberWithInt:69], @"128", [NSNumber numberWithInt:100], @"1324", [NSNumber numberWithInt:1], @"1223",  nil];
        NSSet* keyset = [dict keysOfEntriesPassingTest:^(id key, id value, BOOL* stop) {
            return (BOOl)([value intValue] > 80);
        }];
        NSLog(@"%@", keyset);
    }
    return 0;
}
