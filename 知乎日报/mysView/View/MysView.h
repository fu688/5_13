//
//  MysView.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MysView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton* returnButton;
@property (nonatomic, strong) UIImageView* photo;
@property (nonatomic, strong) UILabel* nameLable;
@property (nonatomic, strong) UITableView* mysTableView;
@end

NS_ASSUME_NONNULL_END
