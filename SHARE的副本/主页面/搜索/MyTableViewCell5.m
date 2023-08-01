//
//  MyTableViewCell5.m
//  SHARE
//
//  Created by 付闯 on 2023/7/26.
//

#import "MyTableViewCell5.h"

@implementation MyTableViewCell5

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(0, 0, 100, 25);
        [self.contentView addSubview:self.label];
    }
    return self;
}
@end
