//
//  contentsTableViewCell.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/16.
//

#import "contentsTableViewCell.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation contentsTableViewCell

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
        
    } else if ([self.reuseIdentifier isEqualToString:@"222"]) {
        
        self.storiesTitleLabel  = [[UILabel alloc] init];
        self.storiesTitleLabel.frame = CGRectMake(27, 30, 250  , 50);
        self.storiesTitleLabel.font = [UIFont systemFontOfSize:20];
        self.storiesTitleLabel.textColor = [UIColor blackColor];
        self.storiesTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.storiesTitleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.storiesTitleLabel];
        
        self.storiesAuthorLabel  = [[UILabel alloc] init];
        self.storiesAuthorLabel.frame = CGRectMake(27, 90, 200, 15);
        self.storiesAuthorLabel.font = [UIFont systemFontOfSize:15];
        self.storiesAuthorLabel.textColor = [UIColor grayColor];
        self.storiesAuthorLabel.numberOfLines = 0;
        [self.contentView addSubview:self.storiesAuthorLabel];
        
        self.striosImage = [[UIImageView alloc] init];
        self.striosImage.frame = CGRectMake(widt - 20 - 80, 20, 80, 80);
        [self.contentView addSubview:self.striosImage];
        
    } else {
        self.storiesTitleLabel  = [[UILabel alloc] init];
        self.storiesTitleLabel.frame = CGRectMake(27, 30, 250  , 50);
        self.storiesTitleLabel.font = [UIFont systemFontOfSize:20];
        self.storiesTitleLabel.textColor = [UIColor blackColor];
        self.storiesTitleLabel.textAlignment = NSTextAlignmentLeft;
        self.storiesTitleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.storiesTitleLabel];
        
        self.storiesAuthorLabel  = [[UILabel alloc] init];
        self.storiesAuthorLabel.frame = CGRectMake(27, 90, 200, 15);
        self.storiesAuthorLabel.font = [UIFont systemFontOfSize:15];
        self.storiesAuthorLabel.textColor = [UIColor grayColor];
        //self.storiesAuthorLabel.textAlignment = NSTextAlignmentLeft;
        self.storiesAuthorLabel.numberOfLines = 0;
        [self.contentView addSubview:self.storiesAuthorLabel];
        
        self.striosImage = [[UIImageView alloc] init];
        self.striosImage.frame = CGRectMake(widt - 20 - 80, 20, 80, 80);
        [self.contentView addSubview:self.striosImage];
    }
    return self;
}

@end
