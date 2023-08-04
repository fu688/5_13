//
//  WhetherTableViewCell.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/2.
//

#import "WhetherTableViewCell.h"

@implementation WhetherTableViewCell

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
        //NSLog(@"333");
        self. cityLabel = [[UILabel alloc] init];
        self.cityLabel.frame = CGRectMake(146.5, 20, 100, 40);
        self.cityLabel.textColor = [UIColor whiteColor];
        self.weaLabel = [[UILabel alloc] init];
        self.weaLabel.frame = CGRectMake(175.5, 70, 50, 20);
        self.weaLabel.textColor = [UIColor whiteColor];
        self.temLabel  = [[UILabel alloc] init];
        self.temLabel.frame = CGRectMake(130.5, 90, 200, 200);
        self.temLabel.textColor = [UIColor whiteColor];
        self.weekLabel= [[UILabel alloc] init];
        self.weekLabel.frame = CGRectMake(20, 270, 100, 30);
        self.weekLabel.textColor = [UIColor whiteColor];
        self.hightemLabel = [[UILabel alloc] init];
        self.hightemLabel.frame = CGRectMake(300, 275, 50, 25);
        self.hightemLabel.textColor = [UIColor whiteColor];
        self.lowtemLabel  = [[UILabel alloc] init];
        self.lowtemLabel.frame = CGRectMake(350, 275, 50, 25);
        self.lowtemLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.cityLabel];
        [self.contentView addSubview:self.weekLabel];
        [self.contentView addSubview:self.temLabel];
        [self.contentView addSubview:self.weaLabel];
        [self.contentView addSubview:self.hightemLabel];
        [self.contentView addSubview:self.lowtemLabel];
        UILabel* label = [[UILabel alloc] init];
        label.frame = CGRectMake(110, 270, 100, 30);
        label.text = @"今天";
        label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
    } else if ([self.reuseIdentifier isEqualToString:@"111"]) {
        //NSLog(@"qwuyopp");
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.frame  = CGRectMake(0, 0, 393, 150);
        self.scrollView.scrollEnabled = YES;
        self.timearray = [[NSMutableArray alloc] init];
        //NSLog(@"111%@", self.timearray);
        self.scrollView.contentSize = CGSizeMake(98.25 * self.timearray.count, 150);
        [self.contentView addSubview:self.scrollView];
        for (int i = 0; i < self.timearray.count; i++) {
            self.timeLabel = [[UILabel alloc] init];
            self.houreWeaImageView = [[UIImageView alloc] init];
            self.houretemLabel = [[UILabel alloc] init];
                
            self.timeLabel.text = self.timearray[i];
            //NSLog(@"111111111%@", self.timearray);
            self.timeLabel.font = [UIFont systemFontOfSize:30];
            self.timeLabel.frame = CGRectMake(20 + 98.5 * i, 10, 98.5, 30);
            self.timeLabel.textColor = [UIColor whiteColor];
            [self.scrollView addSubview:self.timeLabel];
            
            self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageViewArray[i]]];
            self.imageView.frame = CGRectMake(20 + 98.5 * i, 55, 40, 40);
            [self.scrollView addSubview:self.imageView];
            
            self.houretemLabel.text = self.houreTemArray[i];
            self.houretemLabel.font = [UIFont systemFontOfSize:30];
            self.houretemLabel.frame = CGRectMake(20 + 98.5 * i, 110, 98.5, 30);
            self.houretemLabel.textColor = [UIColor systemGray6Color];
            [self.scrollView addSubview:self.houretemLabel];
        }
       
        
        //[self.scrollView addSubview:self.timeLabel];
        //[self.scrollView addSubview:self.houreWeaImageView];
        //[self.scrollView addSubview:self.houretemLabel];
    } else if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.weeklabel1 = [[UILabel alloc] init];
        self.weeklabel1.frame = CGRectMake(20, 10, 100, 20);
        self.weeklabel1.font = [UIFont systemFontOfSize:20];
        self.dayWeaImageView = [[UIImageView alloc] init];
        self.dayWeaImageView.frame = CGRectMake(175.5, 5, 30, 30);
        self.dayHightemLabel = [[UILabel alloc] init];
        self.dayHightemLabel.frame = CGRectMake(300, 12.5, 50, 15);
        self.dayHightemLabel.font = [UIFont systemFontOfSize:15];
        self.dayLowtemLabel = [[UILabel alloc] init];
        self.dayLowtemLabel.frame = CGRectMake(350, 12.5, 50, 15);
        self.dayLowtemLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.weeklabel1];
        [self.contentView addSubview:self.dayWeaImageView];
        [self.contentView addSubview:self.dayHightemLabel];
        [self.contentView addSubview:self.dayLowtemLabel];
    }else if ([self.reuseIdentifier isEqualToString:@"333"]) {
        self.air_tipsLabel = [[UILabel alloc] init];
        self.air_tipsLabel.frame = CGRectMake(20, 10, 373, 20);
        self.air_tipsLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:self.air_tipsLabel];
    }else if ([self.reuseIdentifier isEqualToString:@"444"]) {
        UILabel* label = [[UILabel alloc] init];
        label.text = @"日出";
        label.frame = CGRectMake(20, 5, 50, 10);
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor grayColor];
        [self.contentView addSubview:label];
        UILabel* label1 = [[UILabel alloc] init];
        label1.text = @"日落";
        label1.frame = CGRectMake(300, 5, 50, 10);
        label1.font = [UIFont systemFontOfSize:10];
        label1.textColor = [UIColor grayColor];
        [self.contentView addSubview:label1];
        
        self.sunriseLabel = [[UILabel alloc] init];
        self.sunriseLabel.frame = CGRectMake(20, 20, 150, 30);
        self.sunriseLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.sunriseLabel];
        
        self.sunsetLabel = [[UILabel alloc] init];
        self.sunsetLabel.frame = CGRectMake(300, 20, 150, 30);
        self.sunsetLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.sunsetLabel];
    }else if ([self.reuseIdentifier isEqualToString:@"555"]) {
        UILabel* label = [[UILabel alloc] init];
        label.text = @"湿度";
        label.frame = CGRectMake(20, 5, 50, 10);
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor grayColor];
        [self.contentView addSubview:label];
        UILabel* label1 = [[UILabel alloc] init];
        label1.text = @"空气质量";
        label1.frame = CGRectMake(300, 5, 50, 10);
        label1.font = [UIFont systemFontOfSize:10];
        label1.textColor = [UIColor grayColor];
        [self.contentView addSubview:label1];
        
        self.humidityLabel = [[UILabel alloc] init];
        self.humidityLabel.frame = CGRectMake(20, 20, 150, 30);
        self.humidityLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.humidityLabel];
        
        self.air_levelLabel = [[UILabel alloc] init];
        self.air_levelLabel.frame = CGRectMake(300, 20, 150, 30);
        self.air_levelLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.air_levelLabel];
        
    }else {
        UILabel* label = [[UILabel alloc] init];
        label.text = @"能见度";
        label.frame = CGRectMake(20, 5, 50, 10);
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor grayColor];
        [self.contentView addSubview:label];
        UILabel* label1 = [[UILabel alloc] init];
        label1.text = @"气压";
        label1.frame = CGRectMake(300, 5, 50, 10);
        label1.font = [UIFont systemFontOfSize:10];
        label1.textColor = [UIColor grayColor];
        [self.contentView addSubview:label1];
        
        self.visibilityLabel = [[UILabel alloc] init];
        self.visibilityLabel.frame = CGRectMake(20, 20, 150, 30);
        self.visibilityLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.visibilityLabel];
        
        self.pressureLabel = [[UILabel alloc] init];
        self.pressureLabel.frame = CGRectMake(300, 20, 150, 30);
        self.pressureLabel.font = [UIFont systemFontOfSize:30];
        [self.contentView addSubview:self.pressureLabel];
    }
    return self;
}
@end
