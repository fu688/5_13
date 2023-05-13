//
//  NSNumber+fk.m
//  类别.
//
//  Created by 付闯 on 2023/5/4.
//

#import "NSNumber+fk.h"

@implementation NSNumber (fk)
- (NSNumber*) add: (double) num2 {
    return [NSNumber numberWithDouble:([self intValue] + num2)];
}

@end
