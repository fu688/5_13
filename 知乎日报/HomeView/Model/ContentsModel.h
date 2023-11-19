//
//  ContentsModel.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/16.
//
@protocol storiesModel

@end
@protocol top_StoriesModel

@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface  storiesModel: JSONModel
@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* hint;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSArray* images;
@property (nonatomic,copy)  NSString* id;
@property (nonatomic, copy) NSString* type;
@end

@interface top_StoriesModel : JSONModel
@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* hint;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSString* image;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSString* id;
@end
@interface ContentsModel : JSONModel
@property (nonatomic, copy) NSString* date;
@property (nonatomic, copy) NSArray<storiesModel>* stories;
@property (nonatomic, copy) NSArray<top_StoriesModel>* top_stories;
@end

NS_ASSUME_NONNULL_END
