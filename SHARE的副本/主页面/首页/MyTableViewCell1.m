//
//  MyTableViewCell1.m
//  SHARE
//
//  Created by 付闯 on 2023/7/22.
//

#import "MyTableViewCell1.h"

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
        self.sv = [[UIScrollView alloc] init];
        self.sv.frame  = CGRectMake(10, 0, 373, 200);
        self.sv.pagingEnabled = YES;
        self.sv.scrollEnabled = YES;
        self.sv.contentSize = CGSizeMake(373 * 6, 200);
        for (int i = 0; i <= 5; i++) {
            NSString* strName = [NSString stringWithFormat:@"main_img%d", i];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* view = [[UIImageView alloc] initWithImage:image];
            view.frame = CGRectMake(373 * i, 0, 373, 200);
            [self.sv addSubview:view];
        }
        self.sv.contentOffset = CGPointMake(373, 0);
        self.sv.delegate = self;
        self.mytimer = [[NSTimer alloc] init];
        self.mytimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:YES];
        [self.contentView addSubview:self.sv];
    }
    if ([self.reuseIdentifier isEqualToString:@"444"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img4"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"板式整理术";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share于";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"原创—插画-练习习作";
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
        self.btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.btn.frame = CGRectMake(210, 90, 30, 30);
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        self.label4 = [[UILabel alloc] init];
        self.label4.text = @"100";
        self.label4.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(240, 100, 30, 12);
        [self.contentView addSubview:self.label4];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liulan"]];
        self.imageView1.frame = CGRectMake(280, 97, 16, 16);
        [self.contentView addSubview:self.imageView1];
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"21";
        self.label6.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(300, 100, 30, 12);
        [self.contentView addSubview:self.label6];
        
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"partake-full"]];
        self.imageView2.frame = CGRectMake(340, 100, 16, 16);
        [self.contentView addSubview:self.imageView2];
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"30";
        self.label5.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(360, 100, 30, 12);
        [self.contentView addSubview:self.label5];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img2"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"国外画册分享";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小王";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"平面设计—画册设计";
        self.label2.textColor = [UIColor blackColor];
        self.label2.font = [UIFont systemFontOfSize:13];
        self.label2.frame = CGRectMake(210, 55, 200, 13);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"16分钟前";
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
        [self.contentView addSubview:self.imageView1];
        self.btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.btn.frame = CGRectMake(210, 90, 30, 30);
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        self.label4 = [[UILabel alloc] init];
        self.label4.text = @"90";
        self.label4.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(240, 100, 30, 12);
        [self.contentView addSubview:self.label4];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liulan"]];
        self.imageView1.frame = CGRectMake(280, 97, 16, 16);
        [self.contentView addSubview:self.imageView1];
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"26";
        self.label6.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(300, 100, 30, 12);
        [self.contentView addSubview:self.label6];
        
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"partake-full"]];
        self.imageView2.frame = CGRectMake(340, 100, 16, 16);
        [self.contentView addSubview:self.imageView2];
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"26";
        self.label5.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(360, 100, 30, 12);
        [self.contentView addSubview:self.label5];
    }
    if ([self.reuseIdentifier isEqualToString:@"333"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img3"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"collection扁平设计";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小赵";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"平面设计—海报设计";
        self.label2.textColor = [UIColor blackColor];
        self.label2.font = [UIFont systemFontOfSize:13];
        self.label2.frame = CGRectMake(210, 55, 200, 13);
        self.label3 = [[UILabel alloc] init];
        self.label3.text = @"17分钟前";
        self.label3.textColor = [UIColor grayColor];
        self.label3.font = [UIFont systemFontOfSize:12];
        self.label3.frame = CGRectMake(210, 75, 200, 12);
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.label3];        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.imageView0];
        [self.contentView addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sandian.png"]];
        self.imageView1.frame = CGRectMake(350, 25, 20, 20);
        [self.contentView addSubview:self.imageView1];
        self.btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.btn.frame = CGRectMake(210, 90, 30, 30);
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        self.label4 = [[UILabel alloc] init];
        self.label4.text = @"130";
        self.label4.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(240, 100, 30, 12);
        [self.contentView addSubview:self.label4];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liulan"]];
        self.imageView1.frame = CGRectMake(280, 97, 16, 16);
        [self.contentView addSubview:self.imageView1];
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"8";
        self.label6.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(300, 100, 30, 12);
        [self.contentView addSubview:self.label6];
        
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"partake-full"]];
        self.imageView2.frame = CGRectMake(340, 100, 16, 16);
        [self.contentView addSubview:self.imageView2];
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"7";
        self.label5.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(360, 100, 30, 12);
        [self.contentView addSubview:self.label5];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.imageView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_img1"]];
        self.imageView0.frame = CGRectMake(10, 0, 180, 120);
        self.label = [[UILabel alloc] init];
        self.label.text = @"假日";
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(210, 20, 200, 20);
        self.label1 = [[UILabel alloc] init];
        self.label1.text = @"share小白";
        self.label1.textColor = [UIColor grayColor];
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.frame = CGRectMake(300, 75, 200, 15);
        self.label2 = [[UILabel alloc] init];
        self.label2.text = @"原创—插画-练习习作";
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
        [self.contentView addSubview:self.imageView1];
        self.btn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn setImage:[UIImage imageNamed:@"xihuan"] forState:UIControlStateNormal];
        self.btn.frame = CGRectMake(210, 90, 30, 30);
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        self.label4 = [[UILabel alloc] init];
        //self.label4.text = @"102";
        self.label4.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label4.font = [UIFont systemFontOfSize:12];
        self.label4.frame = CGRectMake(240, 100, 30, 12);
        [self.contentView addSubview:self.label4];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liulan"]];
        self.imageView1.frame = CGRectMake(280, 97, 16, 16);
        [self.contentView addSubview:self.imageView1];
        self.label6 = [[UILabel alloc] init];
        self.label6.text = @"26";
        self.label6.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label6.font = [UIFont systemFontOfSize:12];
        self.label6.frame = CGRectMake(300, 100, 30, 12);
        [self.contentView addSubview:self.label6];
        
        self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"partake-full"]];
        self.imageView2.frame = CGRectMake(340, 100, 16, 16);
        [self.contentView addSubview:self.imageView2];
        self.label5 = [[UILabel alloc] init];
        self.label5.text = @"26";
        self.label5.textColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        self.label5.font = [UIFont systemFontOfSize:12];
        self.label5.frame = CGRectMake(360, 100, 30, 12);
        [self.contentView addSubview:self.label5];
    }
    return self;
}
- (void)timer {
    int num = _sv.contentOffset.x / 373;
    [self.sv setContentOffset:CGPointMake(373 * (num + 1), 0) animated:YES];
    if (num == 5) {
        self.sv.contentOffset  = CGPointMake(373, 0);
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
        [self.mytimer invalidate];
        //self.mytimer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
        self.mytimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.sv.contentOffset.x == 373 * 5) {
        self.sv.contentOffset = CGPointMake(373 * 1, 0);
    }
    if (self.sv.contentOffset.x == 0) {
        self.sv.contentOffset = CGPointMake(373 * 4, 0);
    }
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
