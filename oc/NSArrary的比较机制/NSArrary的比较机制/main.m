//
//  main.m
//  NSArrary的比较机制
//
//  Created by 付闯 on 2023/5/13.
//

#import <Foundation/Foundation.h>
#import "FKUser.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //初始化NSArray对象
        NSArray* array = [NSArray arrayWithObjects:
                          [[FKUser alloc] initWithName:@"sun" pass:@"123"],
                          [[FKUser alloc] initWithName:@"bai" pass:@"345"],
                          [[FKUser alloc] initWithName:@"zhu" pass:@"654"],
                          [[FKUser alloc] initWithName:@"tang" pass:@"178"],
                          [[FKUser alloc] initWithName:@"niu" pass:@"155"],nil];
        FKUser* newUser = [[FKUser alloc] initWithName:@"zhu" pass:@"654"];
        //查找新FKUser对象在集合中的索引
        NSInteger* pos = [array indexOfObject:newUser];
        NSLog(@"newUser的位置为%ld", pos);
        //对集合元素整体调用方法
        [array makeObjectsPerformSelector:@selector(say:) withObject:@"NSArray真强大"];
        NSString* content = @"疯狂iOS讲义";
        //迭代集合内指定范围内的元素，并使用该元素来执行代码块
        [array enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 2)]
            options:NSEnumerationReverse//代码块的第一个参数代表正在遍历的集合元素，第二个参数为这个集合元素的索引
            usingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
            NSLog(@"正在处理的%ld个元素：%@", idx, obj);
            [obj say:content];
        }];
    }
    return 0;
}
