//
//  main.m
//  NSMutableSet
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
        NSMutableSet* set = [NSMutableSet setWithCapacity:10];
        [set addObject:@"疯狂iOS讲义"];
        NSLog(@"添加一个元素后set集合： %@",  NSCollectionToString(set));
        [set addObjectsFromArray:[NSArray arrayWithObjects:@"疯狂Android讲义", @"疯狂Ajax讲义",  @"疯狂iOS讲义", nil]];
        NSLog(@"使用NSArray添加三个元素后：%@",  NSCollectionToString(set));
        [set removeObject:@"疯狂Ajax讲义"];
        NSLog(@"删除一个元素元素后：%@",  NSCollectionToString(set));
        NSSet* set2 = [NSSet setWithObjects:@"孙悟空", @"疯狂iOS讲义", nil];
        [set unionSet:set2];
        [set minusSet:set2];
        [set intersectSet:set2];
        [set setSet:set2];
        NSLog(@"%@", NSCollectionToString(set));
        
    }
    return 0;
}
