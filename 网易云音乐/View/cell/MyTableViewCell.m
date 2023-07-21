//
//  myTableViewCell.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/18.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"000"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"心上有疑问";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(145, 65, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"6 关注 ｜ 2 粉丝 ｜ Lv.7";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:10];
        self.label1.frame = CGRectMake(140, 95, 200, 10);
        self.label2 = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zuijinbofang.png"]];
        self.imageView0.frame = CGRectMake(46.5, 10, 45, 45);
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localdownload.png"]];
        self.imageView1.frame = CGRectMake(131.5, 10, 45, 45);
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yunpan.png"]];
        self.imageView2.frame = CGRectMake(216.5, 10, 45, 45);
        self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yigou.png"]];
        self.imageView3.frame = CGRectMake(301.5, 10, 45, 45);
        self.imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wodehaoyou.png"]];
        self.imageView4.frame = CGRectMake(46.5, 85, 45, 45);
        self.imageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shoucang.png"]];
        self.imageView5.frame = CGRectMake(131.5, 85, 45, 45);
        self.imageView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boke1-copy.png"]];
        self.imageView6.frame = CGRectMake(216.5, 85, 45, 45);
        self.imageView7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yi.png"]];
        self.imageView7.frame = CGRectMake(301.5, 85, 45, 45);
        self.label = [[UILabel alloc] init];
        self.label.text = @"最近播放 ";
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.frame = CGRectMake(46.5, 63, 200, 12);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"本地下载";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(131.5, 63, 200, 12);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"云盘";
        self.label2.textColor = [UIColor grayColor];
        self.label2.font = [UIFont systemFontOfSize:12];
        self.label2.frame = CGRectMake(226.5, 63, 200, 12);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"已购";
        self.label3.textColor = [UIColor grayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        self.label3.frame = CGRectMake(311.5, 63, 200, 12);
        self.label4 = [[UILabel alloc] init];
        self.label4.text = @"我的好友";
        self.label4.textColor = [UIColor grayColor];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(46.5, 138, 200, 12);
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"收藏和赞";
        self.label5.textColor = [UIColor grayColor];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(131.5, 138, 200, 12);
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"我的播客 ";
        self.label6.textColor = [UIColor grayColor];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(216.5, 138, 200, 12);
        self.label7 = [[UILabel alloc] init];
        self.label7.text = @"乐谜团 ";
        self.label7.textColor = [UIColor grayColor];
        self.label7.font = [UIFont systemFontOfSize:12];
        self.label7.frame = CGRectMake(306.5, 137, 200, 12);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];
        [self.contentView addSubview:self.label4];
        [self.contentView addSubview:self.label5];
        [self.contentView addSubview:self.label6];
        [self.contentView addSubview:self.label7];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.imageView1];
        [self.contentView addSubview:self.imageView2];
        [self.contentView addSubview:self.imageView3];
        [self.contentView addSubview:self.imageView4];
        [self.contentView addSubview:self.imageView5];
        [self.contentView addSubview:self.imageView6];
        [self.contentView addSubview:self.imageView7];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liwu.png"]];
        self.imageView0.frame = CGRectMake(30, 8, 32, 32);
        self.label = [[UILabel alloc] init];
        self.label.text = @"领取黑胶会员";
        self.label.textColor = [UIColor grayColor];
        self.label.font = [UIFont systemFontOfSize:12];
        self.label.frame = CGRectMake(80, 19, 200, 12);
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chacha.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"333"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_20230718_172410.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"我喜欢的音乐";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(130, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"119首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(130, 50, 200, 12);
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.label1];
    }
    if ([self.reuseIdentifier isEqualToString:@"444"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"晚安曲_109951163256304204.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"晚安曲";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(130, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"2首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(130, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"555"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"哈哈_109951163988596212.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"哈哈";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(130, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"30首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(130, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"666"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"杨宗纬_109951163314294843.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"杨宗伟";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(130, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"15首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(130, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"777"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"电音_18318963230606093.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"电音";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:17];
        self.label.frame = CGRectMake(130, 20, 200, 17);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"4首";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.frame = CGRectMake(130, 50, 200, 12);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }
    if ([self.reuseIdentifier isEqualToString:@"888"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_20230718_200043.jpg"]];
        self.imageView0.frame = CGRectMake(30, 5, 70, 70);
        self.label = [[UILabel alloc] init];
        self.label.text = @"一键导入外部音乐";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(130, 20, 200, 20);
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
    }    return self;
}
@end
