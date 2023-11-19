//
//  ReviewViewCell.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/3.
//

#import "ReviewViewCell.h"
#import "Masonry.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation ReviewViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.userIcon = [[UIImageView alloc] init];
        self.userIcon.layer.masksToBounds = YES;
        self.userIcon.layer.cornerRadius =  40 / 2;
        
        self.userName = [[UILabel alloc] init];
        [self.userName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
        
        self.userComment = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.userComment setFont:[UIFont systemFontOfSize:17]];
        self.userComment.numberOfLines = 0;
        
        self.time = [[UILabel alloc] init];
        [self.time setFont:[UIFont systemFontOfSize:14]];
        self.time.textColor = [UIColor grayColor];
        
        
        
        self.likeNumber = [[UILabel alloc] init];
        [self.likeNumber setFont:[UIFont systemFontOfSize:14]];
        self.likeNumber.textColor = [UIColor grayColor];
        
        self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.likeButton.tintColor = [UIColor grayColor];
        
        self.commentButton = [[UIImageView alloc] init];
        self.commentButton.tintColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.userIcon];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userComment];
        [self.contentView addSubview:self.time];
        
        [self.contentView addSubview:self.likeNumber];
        [self.contentView addSubview:self.likeButton];
        [self.contentView addSubview:self.commentButton];
        
        [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.width.mas_offset(widt);
        }];
        
        [self.userComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).mas_offset(48);
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.right.mas_equalTo(-20);
            make.height.mas_lessThanOrEqualTo(heigh);
            make.bottom.equalTo(self.contentView).mas_offset(-60);
        }];
        
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
        }];
        
        [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make ){
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.commentButton.mas_left).mas_offset(-30);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.likeButton.mas_left);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
        }];
    } else {
        self.userIcon = [[UIImageView alloc] init];
        self.userIcon.layer.masksToBounds = YES;
        self.userIcon.layer.cornerRadius =  40 / 2;
        
        self.userName = [[UILabel alloc] init];
        [self.userName setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
        
        self.userComment = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.userComment setFont:[UIFont systemFontOfSize:17]];
        self.userComment.numberOfLines = 0;
        
        self.time = [[UILabel alloc] init];
        [self.time setFont:[UIFont systemFontOfSize:14]];
        self.time.textColor = [UIColor grayColor];
        
        
        
        self.likeNumber = [[UILabel alloc] init];
        [self.likeNumber setFont:[UIFont systemFontOfSize:14]];
        self.likeNumber.textColor = [UIColor grayColor];
        
        self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.likeButton.tintColor = [UIColor grayColor];
        
        self.commentButton = [[UIImageView alloc] init];
        self.commentButton.tintColor = [UIColor grayColor];
        
        self.replyComment = [[UILabel alloc] init];
        self.replyComment.font = [UIFont systemFontOfSize:15];
        self.replyComment.textColor = [UIColor grayColor];
        
        self.changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.changeButton.tintColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.userIcon];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.userComment];
        [self.contentView addSubview:self.time];
        
        [self.contentView addSubview:self.likeNumber];
        [self.contentView addSubview:self.likeButton];
        [self.contentView addSubview:self.commentButton];
        [self.contentView addSubview:self.replyComment];
        [self.contentView addSubview:self.changeButton];
        
        
        
        [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        
        [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.top.equalTo(self.contentView.mas_top).offset(22);
            make.width.mas_offset(widt);
        }];
        
        [self.userComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).mas_offset(48);
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.right.mas_equalTo(-20);
            make.height.mas_lessThanOrEqualTo(heigh);
            //make.bottom.equalTo(self.contentView).mas_offset(-60);
        }];
        
        [self.replyComment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.userComment.mas_bottom).mas_offset(10);
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.right.mas_equalTo(-20);
            make.height.mas_lessThanOrEqualTo(heigh);
            make.bottom.equalTo(self.contentView).mas_offset(-60);
        }];
        
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userIcon.mas_right).mas_offset(10);
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
        }];
        
        /*[self.changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.time.mas_right).mas_offset(10);
            
        }]*/
        
        [self.changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.time.mas_right).mas_offset(10);
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(100);
        }];
        
        [self.commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make ){
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.commentButton.mas_left).mas_offset(-30);
            make.size.mas_equalTo(20);
        }];
        
        [self.likeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView).mas_offset(-20);
            make.right.mas_equalTo(self.likeButton.mas_left);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(20);
        }];
    }
    return self;
}
@end
