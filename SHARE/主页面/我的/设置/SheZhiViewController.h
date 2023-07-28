//
//  SheZhiViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SheZhiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* array1;
@property (nonatomic, strong) UIActivityIndicatorView* activitIndicator;
@property (nonatomic, strong) UIAlertController* alert;
@property NSTimer* timerView;
@end

NS_ASSUME_NONNULL_END
