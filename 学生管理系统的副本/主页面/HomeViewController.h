//
//  HomeViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SortViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, returnDelegate, returnDelegate1, returnDelegate2, returnDelegate4>
@property UITableView* tableView;
@property NSInteger count;
@property NSMutableArray* arrayName;
@property NSMutableArray* arrayClass;
@property NSMutableArray* arrayscore;
@property UIButton* buttonAdd;
@property UIButton* buttonDelete;
@property UIButton* buttonChange;
@property UIButton* buttonFind;
@property UIButton* buttonSort;
@property UIButton* buttonExit;
@end

NS_ASSUME_NONNULL_END
