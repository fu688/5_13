//
//  JiBenViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiBenViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* array1;
@property (nonatomic, strong) NSMutableArray* array2;
@end

NS_ASSUME_NONNULL_END
