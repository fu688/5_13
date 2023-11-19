//
//  ContentsModel.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/16.
//

#import "ContentsModel.h"

@implementation ContentsModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
@implementation storiesModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
@implementation  top_StoriesModel
+ (BOOL) propertyIsOptional:(NSString *)propertyName {
    return  YES;
}
@end
