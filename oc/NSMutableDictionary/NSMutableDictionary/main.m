//
//  main.m
//  NSMutableDictionary
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+print.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:89], @"疯狂Android", nil];
        //通过下标设置key-value对，如果已存在key，则覆盖原来的value
        //如果不充在，则添加成功
        dict[@"疯狂Android"] = [NSNumber numberWithInt:99];
        [dict print];
        dict[@"疯狂MXL讲义"] = [NSNumber numberWithInt:88];
        [dict print];
        NSDictionary* dict2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:11], @"123", [NSNumber numberWithInt:22], @"234",  nil];
        [dict addEntriesFromDictionary:dict2];
        [dict print];
        [dict removeObjectForKey:@"234"];
        [dict print];
    }
    return 0;
}
