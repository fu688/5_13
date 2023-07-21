//
//  sheZhiViewController.h
//  网易云音乐
//
//  Created by 付闯 on 2023/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SheZhiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIBarButtonItem* btn2;
@property (nonatomic, strong) UIBarButtonItem* btnNext1;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic,strong) UILabel* label1;
@property (nonatomic, strong) UITableViewCell* cell1;
@property (nonatomic, strong) UITableViewCell* cell;
@property (nonatomic, strong) UITableViewCell* cell2;
@property (nonatomic, strong) UITableViewCell* cell3;
@property (nonatomic, strong) UITableViewCell* cell4;
@property (nonatomic, strong) UITableViewCell* cell5;
@property (nonatomic, strong) UITableViewCell* cell6;
@property (nonatomic, strong) UITableViewCell* cell7;
@property (nonatomic, strong) UITableViewCell* cell8;
@property (nonatomic, strong) UITableViewCell* cell9;
@end

NS_ASSUME_NONNULL_END
