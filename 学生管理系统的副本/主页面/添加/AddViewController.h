//
//  AddViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnDelegate <NSObject>

- (void)passArrayNameAdd: (NSMutableArray*)array1 andArrayClassAdd: (NSMutableArray*) array2 andArrayScoreAdd: (NSMutableArray*) array3;

@end
@interface AddViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property UITableView* tableView;
@property NSMutableArray* arrayNameAdd;
@property NSMutableArray* arrayClassAdd;
@property NSMutableArray* arrayscoreAdd;
@property UITextField* textFieldName;
@property UITextField* textFieldClass;
@property UITextField* textFieldScore;
@property UIImageView* imageViewName;
@property UIImageView* imageViewClass;
@property UIImageView* imageViewScore;
@property UIButton* btnFinish;
@property UIButton* btnReturn;
@property UIAlertController* alert;
@property id<returnDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
