//
//  XiaoxiTableViewCell.m
//  SHARE
//
//  Created by 付闯 on 2023/7/28.
//

#import "XiaoxiTableViewCell.h"

@implementation XiaoxiTableViewCell

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
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(20, 25, 100, 30);
        [self.contentView addSubview:self.label];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(300, 25, 30, 30);
        [self.btn.layer setCornerRadius:10];
        [self.btn.layer setMasksToBounds:YES];
        //[self.btn.layer setBorderWidth:1.0];
        //[self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.btn setTitle:@"<>" forState:UIControlStateNormal];
        [self.btn setTintColor:[UIColor blackColor]];
        [self.btn setBackgroundColor:[UIColor whiteColor]];
        self.btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
        
    }
    return self;
}
- (void)pressBtn:(UIButton*) btn {
    
    if (btn.tintColor == [UIColor blackColor]) {
        [btn setTintColor:[UIColor whiteColor] ];
        [btn setBackgroundColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1]];
        
    } else {
        [btn setTintColor:[UIColor blackColor]];
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}
@end
