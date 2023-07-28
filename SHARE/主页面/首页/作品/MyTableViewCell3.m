//
//  MyTableViewCell3.m
//  SHARE
//
//  Created by 付闯 on 2023/7/24.
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
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_head"]];
        self.imageView0.frame = CGRectMake(10, 5, 60, 60);
        self.label = [[UILabel alloc] init];
        self.label.text = @"假日";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(80, 5, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小白";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(80, 30, 200, 15);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"15分钟前";
        self.label3.textColor = [UIColor grayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        self.label3.frame = CGRectMake(340, 10, 200, 12);
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.btn.frame = CGRectMake(210, 30, 30, 30);
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        self.label4 = [[UILabel alloc] init];
        //self.label4.text = @"102";
        self.label4.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(240, 40, 30, 12);
        [self.contentView addSubview:self.label4];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liulan"]];
        self.imageView1.frame = CGRectMake(280, 40, 16, 16);
        [self.contentView addSubview:self.imageView1];
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"26";
        self.label6.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(300, 40, 30, 12);
        [self.contentView addSubview:self.label6];
        
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"partake-full"]];
        self.imageView2.frame = CGRectMake(340, 40, 16, 16);
        [self.contentView addSubview:self.imageView2];
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"26";
        self.label5.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(360, 40, 30, 12);
        [self.contentView addSubview:self.label5];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img1"]];
        self.imageView0.frame = CGRectMake(10, 0, 373, 200);
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img2"]];
        self.imageView1.frame = CGRectMake(10, 205, 373, 200);
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img3"]];
        self.imageView2.frame = CGRectMake(75, 410, 243, 300);
        self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img4"]];
        self.imageView3.frame = CGRectMake(10, 715, 373, 200);
        self.imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img4"]];
        self.imageView4.frame = CGRectMake(75, 920, 243, 300);
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.imageView1];
        [self.contentView addSubview:self.imageView2];
        [self.contentView addSubview:self.imageView3];
        [self.contentView addSubview:self.imageView4];
    }
    return  self;
}
- (void)pressBtn:(UIButton*) btn {
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [btn setImage:[UIImage imageNamed:@"xihuan-2"] forState:UIControlStateNormal];
        self.label4.text = @"103";
    }
    if (btn.selected == NO) {
        [btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.label4.text = @"102";
    }
}
@end
