//
//  TopStoryCellView.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ContentsModel.h"
#import "FMDatabase.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopStoryCellView : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* topStoriesScrollView;
@property NSMutableArray* urlarray;
@property WKWebView* wkWebView;
@property int deriction;
@property int k;
@property NSString* lastDate;
@property (nonatomic, strong) UIButton* button;

@property (nonatomic, strong) NSMutableArray* buttonarray;
//@property (nonatomic, strong) NSMutableArray* addButtonArray;

@property (nonatomic, strong) UIView* buttomView;
@property (nonatomic, strong) UIButton* returnButton;
@property (nonatomic, strong) UIButton* reviewsVButton;
@property (nonatomic, strong) UIButton* likesButton;
@property (nonatomic, strong) UIButton* keepButton;
@property (nonatomic, strong) UIButton* upLoadButton;

@property (nonatomic, strong) UILabel* likesCountLabel;
@property (nonatomic, copy) NSString* likesCountString;
@property (nonatomic, strong) UILabel* reviewsCountLabel;
@property (nonatomic, copy) NSString* reviewsCountString;

@property (nonatomic, strong) NSMutableArray* dictionArray;
@property (nonatomic, strong) ContentsModel* model;
@property int n;

@property int flage1;
@property int flage2;

@property FMDatabase* collectionDataBase;
@property FMDatabase* likesDataBase;

@property NSMutableArray* scrollArray;
@end

NS_ASSUME_NONNULL_END
