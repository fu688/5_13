//
//  WenZhangViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/24.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCell1.h"
NS_ASSUME_NONNULL_BEGIN
@protocol passCellDelegate <NSObject>

- (void)passCell:(MyTableViewCell1*)cell;

@end
@interface WenZhangViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) MyTableViewCell1* cell1;
@property (nonatomic, assign) id<passCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
