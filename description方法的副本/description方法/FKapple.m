//
//  FKapple.m
//  description方法
//
//  Created by 付闯 on 2023/5/2.
//

#import "FKapple.h"

@implementation FKapple
@synthesize color = _color;
@synthesize weight = _weight;
- (id) initWithColor: (NSString*)color weight: (double) weight
{
    if (self = [super init]) {
        self.color = color;
        self.weight = weight;
    }
        return self;
}
//重写父类的description方法
- (NSString*) description
{
    return [[NSString stringWithFormat:@"<FKapple[_color = %@, _weight = %f]>", self.color, self.weight];
}
@end
