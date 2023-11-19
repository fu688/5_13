//
//  ReviewsModel.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//
@protocol shortReply_toModel

@end
@protocol shortConmentsModel

@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface shortReply_toModel: JSONModel
@property NSString* content;
@property NSString* status;
@property NSString* id;
@property NSString* author;
@end
@interface shortConmentsModel : JSONModel
@property(nonatomic, copy) NSString* author;
@property(nonatomic, copy) NSString* content;
@property(nonatomic, copy) NSString* avatar;
@property(nonatomic, copy) NSString* time;
@property(nonatomic, copy) NSString* id;
@property(nonatomic, copy) NSString* likes;
@property(nonatomic, copy) shortReply_toModel* reply_to;
@end
@interface ReviewsModel : JSONModel
@property (nonatomic, strong) NSArray<shortConmentsModel>* comments;
@end

NS_ASSUME_NONNULL_END
