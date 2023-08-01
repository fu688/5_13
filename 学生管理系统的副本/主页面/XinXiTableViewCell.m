//
//  XinXiTableViewCell.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
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
        self.labelName = [[UILabel alloc] init];
        self.labelName.frame = CGRectMake(20, 5, 100, 30);
        [self.contentView addSubview:self.labelName];
        
        self.labelClass = [[UILabel alloc] init];
        self.labelClass.frame = CGRectMake(180, 5, 100, 30);
        [self.contentView addSubview:self.labelClass];
        
        self.labelScore = [[UILabel alloc] init];
        self.labelScore.frame = CGRectMake(330, 5, 100, 30);
        [self.contentView addSubview:self.labelScore];
    }
    return self;
}
@end
