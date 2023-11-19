//
//  ReviewViewCell.h
//  知乎日报
//
//  Created by 付闯 on 2023/11/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView* userIcon;
@property (nonatomic, strong) UILabel* userName;
@property (nonatomic, strong) UILabel* userComment;
@property (nonatomic, strong) UILabel* time;
@property (nonatomic, strong) UILabel* timeDay;
@property (nonatomic, strong) UILabel* likeNumber;
@property (nonatomic, strong) UIButton* likeButton;
@property (nonatomic, strong) UIImageView* commentButton;
@property (nonatomic, strong) UILabel* replyComment;
@property (nonatomic, strong) UIButton* changeButton;
@end

NS_ASSUME_NONNULL_END
