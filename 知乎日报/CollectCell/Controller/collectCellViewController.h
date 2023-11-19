//
//  collectCellViewController.h
//  知乎日报
//
//  Created by 付闯 on 2023/11/10.
//

#import <UIKit/UIKit.h>
#import "CollectCellView.h"
#import "ContentsModel.h"
#import "story_extralModel.h"
#import "FMDatabase.h"
NS_ASSUME_NONNULL_BEGIN

@interface collectCellViewController : UIViewController
@property (nonatomic, strong) NSMutableArray* titleArray;
@property (nonatomic, strong) NSMutableArray* imageUrlArray;
@property (nonatomic, strong) NSMutableArray* idArray;
@property (nonatomic, strong) NSMutableArray* urlArray;

@property NSNumber* k;

@property CollectCellView* collectCellView;



@property (nonatomic, copy)ContentsModel* model;
@property (nonatomic, copy)story_extralModel* model2;

//@property NSNumber* key;
@property FMDatabase* collectionDataBase;
@property FMDatabase* likesDataBase;

@end

NS_ASSUME_NONNULL_END
