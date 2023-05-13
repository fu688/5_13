//
//  FKCar.m
//  拓展extension
//
//  Created by 付闯 on 2023/5/5.
//

#import "FKCar+drive.h"

@implementation FKCar
@synthesize brand;
@synthesize model;
@synthesize color;
- (void)drive {
    NSLog(@"%@汽车正在路上奔驰", self);//打印对象
}
- (void)drive: (NSString*) owner{
    NSLog(@"%@正在驾驶%@汽车在路上奔驰", owner, self);
}
//重写处理对象的方法来打印对象
- (NSString*) description {
    return [NSString stringWithFormat:@"<FKCar[brand = %@, model = %@, color = %@]>", self.brand, self.model, self.color];
    //返回的是字符串类型
}
@end
