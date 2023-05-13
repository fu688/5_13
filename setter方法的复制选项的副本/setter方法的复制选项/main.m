//
//  main.m
//  setter方法的复制选项
//
//  Created by 付闯 on 2023/5/12.
//

#import <Foundation/Foundation.h>
#import "FKItem.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKItem* p = [[FKItem alloc] init];
        p.name = [NSMutableString stringWithString:@"fc"];
        //[p.nameappendString:@"wu"];不允许修改p的name属性值，使用copy指示符，调用setName方法，复制该对象的不可变副本
    }
    return 0;
}
