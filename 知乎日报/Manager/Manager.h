//
//  Manager.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/16.
//

#import <Foundation/Foundation.h>
#import "ContentsModel.h"
#import "story_extralModel.h"
#import "ReviewsModel.h"
#import "LongReviewsModel.h"
//#import "topStoriesContentsModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^TestSucceedBlock) (ContentsModel* ViewModel);
typedef void (^EorrorBlock) (NSError* error);
//typedef void (^TestSucceedBlock1) (top_StoriesModel* topStoriesModel);
typedef void (^QuestBeforeBlock) (ContentsModel* ViewModel1);
typedef void (^QuestextraBlock) (story_extralModel* story_extraModel);
typedef  void (^QuestReviewsBlock)(ReviewsModel* shortReviewsModel);
typedef void (^QuestLongReviewsBlock)(LongReviewsModel* LongReviewsModel);
@interface Manager : NSObject
+ (instancetype) shareManager;
- (void) makeData: (TestSucceedBlock) succeedBlock error:(EorrorBlock) errorBlock;
//- (void) makeData1:(TestSucceedBlock1)succeedBlock error:(EorrorBlock) errorBlock;
- (void) makeData2:(QuestBeforeBlock)succeedBlock error:(EorrorBlock) errorBlock andLastDate:(NSString*)lastDate;
- (void) makeData3:(QuestextraBlock)succeedBlock error:(EorrorBlock) errorBlock andid:(NSString*) idString;
- (void) makeData4:(QuestReviewsBlock)succeedBlock error:(EorrorBlock) errorBlock andid:(NSString*) idString;
- (void) makeData5:(QuestLongReviewsBlock)succeedBlock error:(EorrorBlock) errorBlock andid: (NSString*) idString;
@end

NS_ASSUME_NONNULL_END
