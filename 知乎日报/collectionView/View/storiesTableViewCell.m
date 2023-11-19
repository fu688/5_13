//
//  storiesTableViewCell.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/6.
//

#import "storiesTableViewCell.h"
#import "Masonry.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation storiesTableViewCell

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
        self.storyTitleLabel = [[UILabel alloc] init];
        self.storyTitleLabel.font = [UIFont systemFontOfSize:18];
        self.storyTitleLabel.numberOfLines = 2;
        self.storyTitleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.storyTitleLabel];
        
        self.storyImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.storyImage];
        
        [self.storyImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(self.contentView).offset(20);
            make.width.offset(80);
            make.height.offset(80);
        }];
        [self.storyTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.top.equalTo(self.contentView).offset(40);
            make.width.offset(widt - 80 - 20 - 40);
        }];
    }
    return self;
}

@end
