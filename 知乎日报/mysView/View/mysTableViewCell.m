//
//  mysTableViewCell.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/5.
//

#import "mysTableViewCell.h"
#import "Masonry.h"
@implementation mysTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.label1 = [[UILabel alloc] init];
        self.label1.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.label1];
        
        self.imageView1 = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView1];
        
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(20);
        }];
        
        [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-30);
            make.top.equalTo(self.contentView).offset(15);
            make.width.offset(30);
            make.height.offset(30);
        }];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
