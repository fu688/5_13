//
//  PassageViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassageViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UISegmentedControl* segControl;
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UITableView* tableView1;
@property (nonatomic, strong) UITableView* tableView2;

@end

NS_ASSUME_NONNULL_END
