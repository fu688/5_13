//
//  MyTableViewCell4.m
//  SHARE
//
//  Created by 付闯 on 2023/7/25.
//

#import "MyTableViewCell4.h"

@implementation MyTableViewCell4

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
    if ([self.reuseIdentifier isEqualToString:@"0"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cb1efb048abfc2acbfacee1e02b7b6be"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"Icon of Barmax";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小白";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"原创-UI-icon";
        self.label2.textColor = [UIColor blackColor];
        self.label2.font = [UIFont systemFontOfSize:13];
        self.label2.frame = CGRectMake(210, 55, 200, 13);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"15分钟前";
        self.label3.textColor = [UIColor grayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        self.label3.frame = CGRectMake(210, 75, 200, 12);
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];     }
    if ([self.reuseIdentifier isEqualToString:@"1"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3c1fc9e89bef5244f59554f92b1d3462 1"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"每个人都需要一个大白";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小王";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"原创作品——摄影";
        self.label2.textColor = [UIColor blackColor];
        self.label2.font = [UIFont systemFontOfSize:13];
        self.label2.frame = CGRectMake(210, 55, 200, 13);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"15分钟前";
        self.label3.textColor = [UIColor grayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        self.label3.frame = CGRectMake(210, 75, 200, 12);
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];     }
    return  self;
}@end
