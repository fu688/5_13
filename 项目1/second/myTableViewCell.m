//
//  myTableViewCell.m
//  项目1
//
//  Created by 付闯 on 2023/7/14.
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
- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"ZARA";
        _lable.textColor = [UIColor blackColor];
        _lable.font = [UIFont systemFontOfSize:30];
        _lable1 = [[UILabel alloc] init];
        _lable1.text = @"微信号：123675";
        _lable1.textColor = [UIColor grayColor];
        _label2 = [[UILabel alloc] init];
        _label2.text = @">";
        _label2.textColor = [UIColor grayColor];
        NSString* str = [NSString stringWithFormat:@"WechatIMG106的副本.jpeg"];
        UIImage* image = [UIImage imageNamed:str];
        _View = [[UIImageView alloc] initWithImage:image];
        _View.frame = CGRectMake(10, 0, 100, 100);
        _lable.frame = CGRectMake(150, 20, 200, 30);
        _lable1.frame = CGRectMake(150, 70, 200, 15);
        _label2.frame = CGRectMake(350, 65, 15, 20);
        [self.contentView addSubview:_lable];
        [self.contentView addSubview:_lable1];
        [self.contentView addSubview:_label2];
        [self.contentView addSubview:_View];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"身份";
        _lable.textColor = [UIColor blackColor];
        NSString* str = [NSString stringWithFormat:@"shenfenrenzheng的副本.png"];
        UIImage* image = [UIImage imageNamed:str];
        _View = [[UIImageView alloc] initWithImage:image];
        _label2 = [[UILabel alloc] init];
        _label2.text = @">";
        _label2.font = [UIFont systemFontOfSize:25];
        _label2.textColor = [UIColor grayColor];
        _View.frame = CGRectMake(15, 10, 30, 30);
        _lable.frame = CGRectMake(80, 10, 40, 30);
        _label2.frame = CGRectMake(360, 10, 15, 30);
        [self.contentView addSubview:_lable];
        [self.contentView addSubview:_View];
        [self.contentView addSubview:_label2];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"设置";
        _lable.textColor = [UIColor blackColor];
        NSString* str = [NSString stringWithFormat:@"shezhi的副本.png"];
        UIImage* image = [UIImage imageNamed:str];
        _View = [[UIImageView alloc] initWithImage:image];
        _label2 = [[UILabel alloc] init];
        _label2.text = @">";
        _label2.font = [UIFont systemFontOfSize:25];
        _label2.textColor = [UIColor grayColor];
        _View.frame = CGRectMake(15, 10, 30, 30);
        _lable.frame = CGRectMake(80, 10, 40, 30);
        _label2.frame = CGRectMake(360, 10, 15, 30);
        [self.contentView addSubview:_lable];
        [self.contentView addSubview:_View];
        [self.contentView addSubview:_label2];
        
    }
    if ([self.reuseIdentifier isEqualToString:@"333"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"帮助";
        _lable.textColor = [UIColor blackColor];
        NSString* str = [NSString stringWithFormat:@"bangzhuzhongxin的副本.png"];
        UIImage* image = [UIImage imageNamed:str];
        _View = [[UIImageView alloc] initWithImage:image];
        _label2 = [[UILabel alloc] init];
        _label2.text = @">";
        _label2.font = [UIFont systemFontOfSize:25];
        _label2.textColor = [UIColor grayColor];
        _View.frame = CGRectMake(15, 10, 30, 30);
        _lable.frame = CGRectMake(80, 10, 40, 30);
        _label2.frame = CGRectMake(360, 10, 15, 30);
        [self.contentView addSubview:_lable];
        [self.contentView addSubview:_View];
        [self.contentView addSubview:_label2];
        
    }    if ([self.reuseIdentifier isEqualToString:@"444"]) {
        _lable = [[UILabel alloc] init];
        _lable.text = @"更多";
        _lable.textColor = [UIColor blackColor];
        NSString* str = [NSString stringWithFormat:@"gengduo的副本.png"];
        UIImage* image = [UIImage imageNamed:str];
        _View = [[UIImageView alloc] initWithImage:image];
        _label2 = [[UILabel alloc] init];
        _label2.text = @">";
        _label2.font = [UIFont systemFontOfSize:25];
        _label2.textColor = [UIColor grayColor];
        _View.frame = CGRectMake(15, 10, 30, 30);
        _lable.frame = CGRectMake(80, 10, 40, 30);
        _label2.frame = CGRectMake(360, 10, 15, 30);
        [self.contentView addSubview:_lable];
        [self.contentView addSubview:_View];
        [self.contentView addSubview:_label2];
        
    }
    return self;
}
- (void)layoutSubviews {
    
}
@end
