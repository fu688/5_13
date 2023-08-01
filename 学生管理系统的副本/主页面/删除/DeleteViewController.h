//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnDelegate1 <NSObject>

- (void)passArrayNameDelete:(NSMutableArray*)array1 andAarrayClassDelete:(NSMutableArray*)array2 andArrayScoreDelete: (NSMutableArray*) array3;
@end
@interface DeleteViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property UITableView* tableView;
@property NSMutableArray* arrayNameDelete;
@property NSMutableArray* arrayClassDelete;
@property NSMutableArray* arrayscoreDelete;
@property UITextField* textFieldName;
@property UITextField* textFieldClass;
@property UIImageView* imageViewName;
@property UIImageView* imageViewClass;
@property UIButton* btnFinish;
@property UIButton* btnReturn;
@property UIAlertController* alert;
@property id<returnDelegate1> delegate;
@end

NS_ASSUME_NONNULL_END
