//
//  main.m
//  对NSarray进行排序
//
//  Created by 付闯 on 2023/5/13.
//

#import <Foundation/Foundation.h>
NSInteger intSort(id num1, id num2, void* context) {
    int  v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1 < v2) {
        return NSOrderedAscending;
    } else if (v1 > v2) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //初始化一个元素为NSString的NSAraay对象
        NSArray* array1 = [NSArray arrayWithObjects:@"OC", @"C", @"C++", @"Ruby", @"perl", @"Pythen", nil];
        //使用集合元素自身的compare:方法进行排序
        array1 = [array1 sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"%@", array1);
        //初始化一个元素为NSNumber的NSAraay对象
        NSArray* array2 = [NSArray arrayWithObjects:
                           [NSNumber numberWithInt:20],
                           [NSNumber numberWithInt:12],
                           [NSNumber numberWithInt:-1],
                           [NSNumber numberWithInt:50],
                           [NSNumber numberWithInt:13],nil];
        //使用自定义的intsort方法进行排序
        array2 = [array2 sortedArrayUsingFunction:intSort context:nil];
        NSLog(@"%@", array2);
        //使用代码块的intsort方法进行排序
        NSArray* array3 = [array2 sortedArrayUsingComparator:^(id obj1, id obj2) {
            if ([obj1 intValue] < [obj2 intValue]) {
                return NSOrderedAscending;
            } else if ([obj1 intValue] > [obj2 intValue]) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        NSLog(@"%@", array3);
    }
    return 0;
}
