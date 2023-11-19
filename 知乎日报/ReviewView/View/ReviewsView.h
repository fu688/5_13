//
//  ReviewsView.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import <UIKit/UIKit.h>
#import "ReviewsModel.h"
#import "LongReviewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReviewsView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton* returnButton;
@property (nonatomic, strong) UILabel* titlelabel;
@property (nonatomic, strong) UIView* topView;
//@property (nonatomic, strong) NSDictionary* shortReviewsDictionary;
//@property (nonatomic, strong) NSDictionary* LongReviewsDictionary;
@property (nonatomic, strong) ReviewsModel* shortReviewsModel;
@property (nonatomic, strong) LongReviewsModel* LongReviewsModel;
@property (nonatomic, strong) UITableView* reviewsTableView;
@property (nonatomic, strong) NSMutableArray* dictionaryArray;
@property (nonatomic, strong) NSMutableArray* selectedArray;
@property (nonatomic, strong) NSMutableArray* longSelectedArray;
@property int k;
@end

NS_ASSUME_NONNULL_END
