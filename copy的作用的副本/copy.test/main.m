//
//  main.m
//  copy.test
//
//  Created by 付闯 on 2023/5/1.
//

#import <Foundation/Foundation.h>
#import "book.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        book* p = [[book alloc] init];
        NSMutableString* s = [NSMutableString stringWithString:@"iOS"];
        [p setName:s];
        NSLog(@"book的name是%@", [p name]);
        //修改字符串 book的name属性也会修改 若是 @property (nonatomic, copy) NSString* name; 则不会修改
        [s appendString:@"讲义"];
        NSLog(@"book的name是%@", [p name]);
    }
    return 0;
}
