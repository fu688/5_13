//
//  MyTableViewCell3.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/20.
//

#import "MyTableViewCell3.h"

@implementation MyTableViewCell3

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
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"晚安曲_109951163256304204.jpg"]];
        self.imageView0.frame = CGRectMake(0, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"晚安";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(100, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"颜中人";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(100, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bofang.png"]];
        self.imageView1.frame = CGRectMake(290, 30, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"哈哈_109951163988596212.jpg"]];
        self.imageView0.frame = CGRectMake(0, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"孤单心事";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(100, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"颜中人";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(100, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bofang.png"]];
        self.imageView1.frame = CGRectMake(290, 30, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"杨宗纬_109951163314294843.jpg"]];
        self.imageView0.frame = CGRectMake(0, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"杨宗伟";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(100, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"15首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(100, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bofang.png"]];
        self.imageView1.frame = CGRectMake(290, 30, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    return  self;
}
@end
