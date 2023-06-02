//
//  NSDictionary+print.m
//  NSMutableDictionary
//
//  Created by 付闯 on 2023/5/16.
//

#import "NSDictionary+print.h"

@implementation NSDictionary (print)
- (void) print {
    NSMutableString* result = [NSMutableString stringWithString:@"{"];
    for (id key in self) {
        [result appendString:[key description]];
        [result appendString:@"="];
        [result appendString:[self[key] description]];
        [result appendString:@", "];
    }
    NSUInteger len = [result length];
    [result deleteCharactersInRange:NSMakeRange(len - 2, 2)];
    [result appendString:@"}"];
    NSLog(@"%@", result);
}
@end
