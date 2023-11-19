//
//  CollectView.h
//  知乎日报
//
//  Created by 付闯 on 2023/11/6.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
NS_ASSUME_NONNULL_BEGIN

@interface CollectView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton* returnButton;
@property (nonatomic, strong) UILabel* titlelabel;
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UITableView* storiesTableView;
@property (nonatomic, strong) NSMutableArray* titleArray;
@property (nonatomic, strong) NSMutableArray* imageUrlArray;
@property (nonatomic, strong) NSMutableArray* idArray;
@property (nonatomic, strong) NSMutableArray* urlArray;
@property (nonatomic, strong) NSNumber* index;

@property (nonatomic, strong) FMDatabase* collectionDataBase;
@end

NS_ASSUME_NONNULL_END
