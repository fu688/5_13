//
//  myTableViewCell2.h
//  网易云音乐
//
//  Created by 付闯 on 2023/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell2 : UITableViewCell<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UIImageView* imagView;
@property (nonatomic, strong) UIScrollView* sv;
@property (nonatomic, strong) NSTimer* mytimer;
@property (nonatomic,strong) UILabel* label;
@property (nonatomic, strong) UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
