//
//  XinxiTableViewCell.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import "XinXiTableViewCell.h"

@implementation XinXiTableViewCell

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
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.imageViewWhether = [[UIImageView alloc] init];
        self.imageViewWhether.frame = CGRectMake(0, 0, 393, 150);
        [self.contentView addSubview:self.imageViewWhether];

        self.labelCity = [[UILabel alloc] init];
        self.labelCity.frame = CGRectMake(20, 10, 200, 40);
        [self.contentView addSubview:self.labelCity];
    }
    return self;
}
@end
