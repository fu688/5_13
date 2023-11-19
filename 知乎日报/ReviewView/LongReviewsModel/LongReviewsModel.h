//
//  LongReviewsModel.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/30.
//
@protocol longReply_toModel

@end
@protocol longConmentsModel

@end

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface longReply_toModel: JSONModel
@property NSString* content;
@property NSString* status;
@property NSString* id;
@property NSString* author;
@end
@interface longConmentsModel : JSONModel
@property(nonatomic, copy) NSString* author;
@property(nonatomic, copy) NSString* content;
@property(nonatomic, copy) NSString* avatar;
@property(nonatomic, copy) NSString* time;
@property(nonatomic, copy) NSString* id;
@property(nonatomic, copy) NSString* likes;
@property(nonatomic, copy) longReply_toModel* reply_to;

@end
@interface LongReviewsModel : JSONModel
@property (nonatomic, strong) NSArray<longConmentsModel>* comments;
@end

NS_ASSUME_NONNULL_END
