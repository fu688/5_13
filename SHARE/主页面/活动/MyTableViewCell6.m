//
//  MyTableViewCell6.m
//  SHARE
//
//  Created by 付闯 on 2023/7/26.
//

#import "MyTableViewCell6.h"

@implementation MyTableViewCell6

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
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(10, 10, 373, 180);
        [self.contentView addSubview:self.imageView1];
    }
    return self;
}
@end
