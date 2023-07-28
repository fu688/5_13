//
//  SiXinTableViewCell.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "SiXinTableViewCell.h"

@implementation SiXinTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(150, 10, 100, 20);
        self.label.font = [UIFont systemFontOfSize:20];
        self.label1 = [[UILabel alloc] init];
        self.label1.frame = CGRectMake(150, 45, 200, 10);
        self.label1.font = [UIFont systemFontOfSize:10];
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(20, 25, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView1];
    }
    return self;
}
@end
