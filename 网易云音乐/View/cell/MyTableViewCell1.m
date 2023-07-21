//
//  myTableViewCell1.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/19.
//

#import "MyTableViewCell1.h"
#import "SheZhiViewController.h"
@implementation MyTableViewCell1

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
        self.label.text = @"我的消息";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wodexiaoxi-3.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"云贝中心";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yunbeiguanli-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"商城";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shangcheng-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"333"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"设置";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shezhi.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"444"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"深色模式";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shensemoshi-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.mySwitch = [[UISwitch alloc] init];
        self.mySwitch.frame = CGRectMake(320, 10, 200, 30);
        [self.mySwitch setOnTintColor:[UIColor redColor]];
        //[self.mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
        SheZhiViewController* my = [[SheZhiViewController alloc] init];
        [self.mySwitch addTarget:my action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.mySwitch];
        
    }
    if ([self.reuseIdentifier isEqualToString:@"555"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"定时关闭";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dingshiguanbi-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"666"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"个性装扮";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gexingzhuangban-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"777"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"边听边存";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.frame = CGRectMake(100, 15, 200, 15);
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tongbuyinle-2.png"]];
        self.imageView0.frame = CGRectMake(30, 10, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView0];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youkuohao.png"]];
        self.imageView1.frame = CGRectMake(350, 15, 20, 20);
        [self.contentView addSubview:self.imageView1];
        //[self.contentView addSubview:self.imageView];
    }
    if ([self.reuseIdentifier isEqualToString:@"888"]) {
        self.label = [[UILabel alloc] init];
        self.label.text = @"退出登录/关闭";
        self.label.textColor = [UIColor redColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(130, 25, 200, 20);
        [self.contentView addSubview:self.label];
        //[self.contentView addSubview:self.imageView];
    }
    return self;
}

@end
