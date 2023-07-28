//
//  SearchReasultViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchReasultViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITextField* textFiled;
@property (nonatomic, strong) UIButton* btn1;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
