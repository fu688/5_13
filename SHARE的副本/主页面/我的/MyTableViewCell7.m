//
//  MyTableViewCell7.m
//  SHARE
//
//  Created by 付闯 on 2023/7/26.
//

#import "MyTableViewCell7.h"

@implementation MyTableViewCell7

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
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(80, 25, 100, 30);
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(20, 25, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView1];
        self.imageView2 = [[UIImageView alloc] init];
        self.imageView2.frame = CGRectMake(350, 25, 30, 30);
        [self.contentView addSubview:self.imageView2];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(20, 25, 100, 100);
        
        self.label = [[UILabel alloc] init];
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(140, 35, 200, 20);
        
        self.label1 = [[UILabel alloc] init];
        self.label1.textColor = [UIColor blackColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(140, 60, 200, 12);
        
        self.label2 = [[UILabel alloc] init];
        self.label2.textColor = [UIColor grayColor];
        self.label2.font = [UIFont systemFontOfSize:12];
        self.label2.frame = CGRectMake(140, 90, 200, 15);
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView1];
        [self.contentView addSubview:self.label];
        
    }
    return self;
}
@end
