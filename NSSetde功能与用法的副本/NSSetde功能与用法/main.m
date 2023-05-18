//
//  main.m
//  NSSetde功能与用法
//
//  Created by 付闯 on 2023/5/14.
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
        NSSet* set1 = [NSSet setWithObjects:@"疯狂iOS讲义", @"疯狂Android讲义", @"疯狂Ajax讲义",  @"疯狂iOS讲义", nil];
        NSLog(@"set1集合元素个数为%ld", [set1 count]);
        NSLog(@"s1集合： %@",  NSCollectionToString(set1));
        NSSet* set2 = [NSSet setWithObjects:@"孙悟空", @"疯狂Android讲义", @"猪八戒", nil];
        NSLog(@"s2集合： %@",  NSCollectionToString(set2));
        set1 = [set1 setByAddingObject:@"权威指南"];
        NSLog(@"添加一个元素后s1集合： %@",  NSCollectionToString(set1));
        NSSet* s = [set1 setByAddingObjectsFromSet:set2];
        NSLog(@"set1与set2的并集： %@",  NSCollectionToString(s));
        BOOL b = [set1 intersectsSet:set2];
        NSLog(@"set1与set2的是否有交集： %d", b);
        BOOL bo = [set2 isSubsetOfSet:set1];
        NSLog(@"set2是否为set1的子集： %d",  bo);
        BOOL bb = [set1 containsObject:@"疯狂Ajax讲义"];
        NSLog(@"set1是否包含疯狂Ajax讲义：%d", bb);
        NSLog(@"set1取出一个元素：%@", [set1 anyObject]);
        NSLog(@"set1取出一个元素：%@", [set1 anyObject]);
        //使用代码块对集合元素进行过滤
        NSSet* newSet = [set1 objectsPassingTest:^(id obj, BOOL* stop) {
            return (BOOL)([obj length] > 8);
        }];
        NSLog(@"set1中长度大于8的元素：%@", NSCollectionToString(newSet));
        
    }
    return 0;
}
