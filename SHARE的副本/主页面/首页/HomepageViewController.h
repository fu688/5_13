//
//  HomepageViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "WenZhangViewController.h"
#import "MyTableViewCell1.h"
NS_ASSUME_NONNULL_BEGIN
@interface HomepageViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, passCellDelegate>
@property (nonatomic, strong) UITableView* tableView;
@property MyTableViewCell1* cell;
@property int i;
@end

NS_ASSUME_NONNULL_END
