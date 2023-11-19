//
//  ReviewsModel.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import "ReviewsModel.h"
@implementation shortReply_toModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
@implementation shortConmentsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
@implementation ReviewsModel
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
