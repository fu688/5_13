//
//  main.m
//  拓展extension
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>
#import "FKCar+drive.h"
#import "FKCar.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        FKCar* car = [[FKCar alloc] init];
        //使用点方法为car对象的属性赋值
        car.model = @"bmw";
        car.brand = @"666";
        car.color = @"black";
        [car drive];
        [car drive:@"fc"];
    }
    return 0;
}
