//
//  main.m
//  使用枚举器遍历NSArray集合元素
//
//  Created by 付闯 on 2023/5/13.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray* array = [NSArray arrayWithObjects:
                          [NSNumber numberWithInt:20],
                          [NSNumber numberWithInt:12],
                          [NSNumber numberWithInt:-1],
                          [NSNumber numberWithInt:50],
                          [NSNumber numberWithInt:13],nil];
        NSEnumerator* en = [array objectEnumerator];
        id object;
        while (object = [en nextObject]) {
            NSLog(@"%d", [object intValue]);
        }
        NSLog(@"---下面逆序遍历---");
        en = [array reverseObjectEnumerator];
        while (object = [en nextObject]) {
            NSLog(@"%@", object);
        }
    }
    return 0;
}
