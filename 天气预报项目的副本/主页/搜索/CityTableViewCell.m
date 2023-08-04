//
//  cityTableViewCell.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

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
        //NSLog(@"333");
        self.labelCity = [[UILabel alloc] init];
        self.labelCity.frame = CGRectMake(146.5, 5, 100, 10);
        [self.contentView addSubview:self.labelCity];
    }
    return self;
}
@end
