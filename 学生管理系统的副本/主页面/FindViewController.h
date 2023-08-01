//
//  FindViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray* arrayNameFind;
@property NSMutableArray* arrayClassFind;
@property NSMutableArray* arrayscoreFind;
@property UITextField* textFieldName;
@property UITextField* textFieldClass;
@property UITextField* textFieldScore;
@property UIImageView* imageViewName;
@property UIImageView* imageViewClass;
@property UIImageView* imageViewScore;
@property UIButton* btnFinish;
@property UIButton* btnReturn;
@property UITableView* tableView;
@property UIAlertController* alert;
@end

NS_ASSUME_NONNULL_END
