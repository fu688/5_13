//
//  main.m
//  NSCountSet
//
//  Created by 付闯 on 2023/5/15.
//

#import <Foundation/Foundation.h>
NSString* NSCollectionToString(id array) {
    NSMutableString* result = [NSMutableString stringWithString:@"["];
    for (id obj in array) {
        [result appendString:[obj description]];
        [result appendString:@", "];
    }
    NSUInteger len = [result length];
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"]"];
    return result;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSCountedSet* set = [NSCountedSet setWithObjects:@"疯狂iOS讲义", @"疯狂Android", @"疯狂Ajax讲义", nil];
        [set addObject:@"疯狂iOS讲义"];
        [set addObject:@"疯狂iOS讲义"];
        NSLog(@"%@",NSCollectionToString(set));
        NSLog(@"疯狂iOS讲义的添加次数%ld", [set countForObject:@"fenfkiOS讲义"]);
        [set removeObject:@"疯狂iOS讲义"];
        NSLog(@"删除一次后的结果：%@",NSCollectionToString(set));
        [set removeObject:@"疯狂iOS讲义"];
        NSLog(@"删除两次后的结果：%@",NSCollectionToString(set));
        [set removeObject:@"疯狂iOS讲义"];
        NSLog(@"删除三次后的结果：%@",NSCollectionToString(set));
    }
        return 0;
}
