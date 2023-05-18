//
//  main.m
//  可变数组（NSMutableArray)
//
//  Created by 付闯 on 2023/5/14.
//

#import <Foundation/Foundation.h>
NSString* NSCollectionToString(NSArray* array) {
    NSMutableString* result = [NSMutableString stringWithString:@"["];
    for (id obj in array) {
        [result appendString:[obj description]];
        [result appendString:@", "];
    }
    NSUInteger len = [result length];//获取字符串长度
    //去掉字符串最后两个字符
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"]"];
    return result;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray* array = [NSMutableArray arrayWithObjects:@"孙悟空", @"宝玉", @"黛玉",  nil];
        [array addObject:@"疯狂iOS讲义"];
        NSLog(@"追加最后一个元素后：%@",  NSCollectionToString(array));
        [array addObjectsFromArray:[NSArray arrayWithObjects:@"张飞", @"关羽", nil]];
        NSLog(@"追加最后两个元素后：%@",  NSCollectionToString(array));
        [array insertObject:@"疯狂Ajax讲义" atIndex:2];
        NSLog(@"在索引为2处插入一个元素后：%@", NSCollectionToString(array));
        [array insertObjects:[NSArray arrayWithObjects:@"武松", @"林冲", nil] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(3, 2)]];
        NSLog(@"插入多个元素后：%@",  NSCollectionToString(array));
        [array removeLastObject];
        NSLog(@"删除最后一个元素后：%@",  NSCollectionToString(array));
        [array removeObjectAtIndex:5];
        NSLog(@"删除索引为5的元素后：%@",  NSCollectionToString(array));
        [array removeObjectsInRange:NSMakeRange(2, 3)];
        NSLog(@"删除索引为2-5的元素后：%@",  NSCollectionToString(array));
        [array replaceObjectAtIndex:2 withObject:@"疯狂Android"];
        NSLog(@"替换索引为2的元素后：%@",  NSCollectionToString(array));
        
    }
    return 0;
}
