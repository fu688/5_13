//
//  ContentsView.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/15.
//

#import <UIKit/UIKit.h>
#import "ContentsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContentsView : UIView<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property UIScrollView* imageScrollView;
@property NSTimer* mytimer;

@property (nonatomic,strong) UITableView* homeTableView;
@property (nonatomic, strong) NSMutableArray* dictinaryArray;
@property (nonatomic, strong) NSMutableArray* topstoriesDictionaryArray;

@property (nonatomic, strong) NSMutableArray* urlArray;
@property (nonatomic,strong) NSMutableArray* idArray;
@property ContentsModel* model;
@property ContentsModel* model1;
@property (nonatomic,strong) UIActivityIndicatorView* activityIndicator;
@property (nonatomic, strong) NSNumber* num1;
@property (nonatomic, strong) NSNumber* num2;

@property (nonatomic, strong) NSString* lastDate;

@property (nonatomic, strong) NSString* date;

@end

NS_ASSUME_NONNULL_END
