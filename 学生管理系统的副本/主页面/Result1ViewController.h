//
//  Result1ViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Result1ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray* arrayName;
@property NSMutableArray* arrayClass;
@property NSMutableArray* arrayScore;
@property UITableView* tableView;
@property UIButton* btnReturn;
@end

NS_ASSUME_NONNULL_END
