//
//  AttentionTableViewCell.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "AttentionTableViewCell.h"

@implementation AttentionTableViewCell

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
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(150, 25, 100, 30);
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.frame = CGRectMake(20, 25, 30, 30);
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.imageView1];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(300, 25, 80, 30);
        [self.btn.layer setCornerRadius:8.0];
        [self.btn.layer setMasksToBounds:YES];
        [self.btn.layer setBorderWidth:1.0];
        [self.btn.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.btn setTitle:@"+关注" forState:UIControlStateNormal];
        [self.btn setTintColor:[UIColor blackColor]];
        [self.btn setBackgroundColor:[UIColor whiteColor]];
        self.btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.btn];
    }
    return self;
}
- (void)pressBtn:(UIButton*)btn {
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        [btn setTitle:@"已关注" forState:UIControlStateNormal];
        //[btn setTitleColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1] forState:UIControlStateNormal];
        //[btn setTintColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1]];
        //[btn.layer setBorderColor:[UIColor systemBlueColor].CGColor];
        
    }
    if (btn.selected == NO) {
        NSLog(@"111111");
        [btn setTitle:@"+关注" forState:UIControlStateNormal];
        //[btn.layer setBorderColor:[UIColor blackColor].CGColor];
        [btn setTintColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
}
@end
