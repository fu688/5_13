//
//  main.m
//  有序集合（NSOrder和NSMutableOrder)
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
       NSOrderedSet* set = [NSOrderedSet orderedSetWithObjects:
                            [NSNumber numberWithInt:40],
                            [NSNumber numberWithInt:12],
                            [NSNumber numberWithInt:-9],
                            [NSNumber numberWithInt:28],
                            [NSNumber numberWithInt:12],
                            [NSNumber numberWithInt:17],
                            nil];
        NSLog(@"%@", NSCollectionToString);
        NSLog(@"set集合的第一个元素：%@", [set firstObject]);
        NSLog(@"set集合的最后一个元素：%@", [set lastObject]);
        NSLog(@"set集合索引为2的元素：%@", [set objectAtIndex:2]);
        NSLog(@"28在set集合的索引为%ld", [set indexOfObject:[NSNumber numberWithInt:28]]);
        NSInteger* indexSet = [set indexesOfObjectsPassingTest:^(id obj, NSUInteger idx,  BOOL* stop) {
            return; (BOOL) ([obj intValue] > 20);
        }];
        NSLog(@"set集合中元素大于20的集合元素%@", indexSet);
        
    }
    return 0;
}
