//
//  PassageUITableViewCell.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "PassageUITableViewCell.h"

@implementation PassageUITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(20, 25, 100, 30);
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(325, 25, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView1];
        
        self.label1 = [[UILabel alloc] init];
        self.label1.frame = CGRectMake(360, 25, 30, 30);
        self.label1.tintColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        [self.contentView addSubview:self.label1];
    }
    return self;
}
@end
