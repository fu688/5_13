//
//  ChangeViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol returnDelegate2 <NSObject>

- (void)passarraynameChange:(NSMutableArray*) array1 andarrayChange:(NSMutableArray*) array2 andarrayChange:(NSMutableArray*) array3;

@end
@interface ChangeViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property UITableView* tableView;
@property NSMutableArray* arrayNameChange;
@property NSMutableArray* arrayClassChange;
@property NSMutableArray* arrayscoreChange;
@property UITextField* textFieldName;
@property UITextField* textFieldClass;
@property UITextField* textFieldScore;
@property UIImageView* imageViewName;
@property UIImageView* imageViewClass;
@property UIImageView* imageViewScore;
@property UIButton* btnFinish;
@property UIButton* btnReturn;
@property UIAlertController* alert;
@property id<returnDelegate2> delegate;
@property NSUInteger* i;
@end

NS_ASSUME_NONNULL_END
