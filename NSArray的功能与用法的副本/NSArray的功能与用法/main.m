//
//  main.m
//  NSArray的功能与用法
//
//  Created by 付闯 on 2023/5/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:@"疯狂iOS讲义", @"疯狂Android讲义",@"疯狂ajax讲义", @"疯狂MXL讲义", @"Struct 2.x指南", nil];
        NSLog(@"第一个元素：%@", [array objectAtIndex: 0]);
        NSLog(@"索引为1元素：%@", [array objectAtIndex: 1]);
        NSLog(@"最后一个元素：%@", [array lastObject]);
        NSArray* arr1 = [array objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 3)]];
        
        NSLog(@"%@", arr1);
        for (int i = 0; i < arr1.count; i++) {
            NSLog(@"%@", [arr1 objectAtIndex:i]);
            NSLog(@"%@", arr1[i]);
        }
        NSLog(@"疯狂Android讲义的位置为：%ld", [array indexOfObject:@"疯狂Android讲义"]);
        NSLog(@"在2-5范围疯狂Android讲义的位置为：%ld", [array indexOfObject:@"疯狂Android讲义"inRange:NSMakeRange(2, 3)]);
        array = [array arrayByAddingObject:@"孙悟空"];
        array = [array arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"宝玉", @"黛玉", nil]];
        for (int i = 0; i < array.count; i++) {
            NSLog(@"%@", [array objectAtIndex:i]);
            NSLog(@"%@", array[i]);
        }
        NSArray* arr2 = [array subarrayWithRange:NSMakeRange(5, 3)];
        [arr2 writeToFile:@"myfile.txt" atomically:YES];
        
    }
    return 0;
}
