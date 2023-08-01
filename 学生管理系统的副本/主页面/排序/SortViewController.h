//
//  SortViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnDelegate4 <NSObject>

- (void)passArrayName:(NSMutableArray*) array1 andArrayClass:(NSMutableArray*) array2 andArrayScore:(NSMutableArray*) array3;

@end
@interface SortViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray* arrayNameSort;
@property NSMutableArray* arrayClassSort;
@property NSMutableArray* arrayScoreSort;
@property UIButton* buttonNameSort;
@property UIButton* buttonClassSort;
@property UIButton* buttonScoreSort;
@property UIButton* buttonReturn;
@property UITableView* tableView;
@property id<returnDelegate4> delegate;
@end

NS_ASSUME_NONNULL_END
