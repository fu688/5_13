//
//  topStoriesContentsModel.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/20.
//
@protocol sectionModel

@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface sectionModel : JSONModel
@property (nonatomic, copy) NSString* thumbnail;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* id;
@end
@interface topStoriesContentsModel : JSONModel
@property (nonatomic, copy) NSString* body;
@property (nonatomic, copy) NSString* image_hue;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;
@property (nonatomic, copy) NSString* image;
@property (nonatomic, copy) NSString* share_url;
@property (nonatomic, copy) NSString* js;
@property (nonatomic, copy) NSString* id;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSArray* images;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSArray* css;
@property (nonatomic, copy) NSArray<sectionModel>* section;
@end

NS_ASSUME_NONNULL_END
