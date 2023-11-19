//
//  TopStoryCellController.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import <UIKit/UIKit.h>
//#import <UIKit/UIKit.h>
#import "TopStoryCellView.h"
#import "ContentsModel.h"
#import "story_extralModel.h"
#import "FMDatabase.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopStoryCellController : UIViewController
@property NSNumber* k;
@property NSMutableArray* urlArray;
@property TopStoryCellView* topstoriescontentsView;
@property (nonatomic, copy) NSString* lastDate;

@property (nonatomic, copy)NSMutableArray* dictionaryArray;
@property (nonatomic, copy)ContentsModel* model;
@property (nonatomic, copy)story_extralModel* model2;
@property (nonatomic, copy)NSMutableArray* idArray;
@property NSNumber* key;
@property FMDatabase* collectionDataBase;
@property FMDatabase* likesDataBase;
@end

NS_ASSUME_NONNULL_END
