//
//  myTableViewCell.m
//  自定义cell
//
//  Created by 付闯 on 2023/6/5.
//

#import "myTableViewCell.h"

@implementation myTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
       // Configure the view for the selected state
}
//要实现的方法一，对属性的赋值并添加
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"688"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"688";
        _lable.textColor = [UIColor grayColor];
        NSString* str = [NSString stringWithFormat:@"_1.jpg"];
        UIImage* image = [UIImage imageNamed:str];
        _imageview = [[UIImageView alloc] init];
        _imageview.image = image;
    }
    [self.contentView addSubview:_lable];
    [self.contentView addSubview:_imageview];
    return self;
}
- (void)layoutSubviews {
    _lable.frame = CGRectMake(30, 10, 50, 50);
    _imageview.frame = CGRectMake(100, 10, 50, 50);
}
@end
