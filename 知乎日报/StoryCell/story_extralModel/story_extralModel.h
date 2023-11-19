//
//  story_extralModel.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/26.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface story_extralModel : JSONModel
@property(nonatomic, copy) NSString* long_comments;
@property (nonatomic, copy) NSString* popularity;
@property (nonatomic, copy) NSString* short_comments;
@property (nonatomic, copy) NSString* comments;
@end

NS_ASSUME_NONNULL_END
