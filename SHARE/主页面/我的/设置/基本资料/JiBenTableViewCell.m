//
//  JiBenTableViewCell.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "JiBenTableViewCell.h"

@implementation JiBenTableViewCell

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
        self.label1 = [[UILabel alloc] init];
        self.label1.frame = CGRectMake(20, 35, 100, 20);
        self.label2 = [[UILabel alloc] init];
        self.label2.frame = CGRectMake(150, 35, 200, 20);
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(150, 15, 70, 70);
        [self.contentView addSubview:self.label1];
        [self.contentView addSubview:self.label2];
        [self.contentView addSubview:self.imageView1];
        
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.label1 = [[UILabel alloc] init];
        self.label1.frame = CGRectMake(20, 25, 100, 30);
        [self.contentView addSubview:self.label1];
        self.label2 = [[UILabel alloc] init];
        self.label2.frame = CGRectMake(210, 25, 30, 30);
        [self.contentView addSubview:self.label2];
        self.label3 = [[UILabel alloc] init];
        self.label3.frame = CGRectMake(300, 25, 30, 30);
        [self.contentView addSubview:self.label3];
        self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn1.frame = CGRectMake(150, 5, 70, 70);
        //[self.btn1 setImage:[UIImage imageNamed:@"nan_3"] forState:UIControlStateNormal];
        [self.btn1 setImage:[UIImage imageNamed:@"nan-4"] forState:UIControlStateNormal];
        self.btn1.selected = YES;
        [self.btn1 addTarget:self action:@selector(pressBtn1:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn1];
        self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn2.frame = CGRectMake(240, 5, 70, 70);
        [self.btn2 setImage:[UIImage imageNamed:@"nv-3"] forState:UIControlStateNormal];
        self.btn2.selected = NO;
        [self.btn2 addTarget:self action:@selector(pressBtn2:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn2];
    }
    return self;
}
- (void)pressBtn1:(UIButton*) btn{
    NSLog(@"Q");
    if (btn.selected == NO) {
        NSLog(@"q");
        [self.btn1 setImage:[UIImage imageNamed:@"nan-4"] forState:UIControlStateNormal];
        [self.btn2 setImage:[UIImage imageNamed:@"nv-3"] forState:UIControlStateNormal];
        self.btn1.selected = YES;
        self.btn2.selected = NO;
    }
}
- (void)pressBtn2:(UIButton*) btn {
    NSLog(@"R");
    if (btn.selected == NO) {
        NSLog(@"r");
        [self.btn1 setImage:[UIImage imageNamed:@"nan-3"] forState:UIControlStateNormal];
        [self.btn2 setImage:[UIImage imageNamed:@"nv-4"] forState:UIControlStateNormal];
        self.btn2.selected = YES;
        self.btn1.selected = NO;
    }
}
@end
