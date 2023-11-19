//
//  MysView.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/21.
//

#import "MysView.h"
#import "Masonry.h"
#import "mysTableViewCell.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation MysView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    //self.backgroundColor = [UIColor whiteColor];
    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.returnButton setImage:[UIImage imageNamed:@"fanhui1-copy"] forState:UIControlStateNormal];
    [self addSubview:self.returnButton];
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(50);
        make.width.offset(30);
        make.height.offset(30);
    }];
    
    self.photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG119"]];
    self.photo.layer.masksToBounds = YES;
    self.photo.layer.cornerRadius = 100 / 2;
    [self addSubview:self.photo];
    [self.photo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.left.equalTo(self).offset(widt / 2 - 50);
        make.width.offset(100);
        make.height.offset(100);
    }];
    
    self.nameLable = [[UILabel alloc] init];
    self.nameLable.text = @"心上有疑问";
    self.nameLable.font = [UIFont systemFontOfSize:25];
    [self addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.photo.mas_bottom).mas_offset(10);
        make.left.equalTo(self).mas_offset(widt / 2 - 70);
        //make.width.offset(140);
        //make.height.offset(25);
    }];
    
    self.mysTableView = [[UITableView alloc] init];
    self.mysTableView.delegate = self;
    self.mysTableView.dataSource = self;
    [self addSubview:self.mysTableView];
    [self.mysTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(20);
        make.left.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(120);
    }];
    
    [self.mysTableView registerClass:[mysTableViewCell class] forCellReuseIdentifier:@"111"];
    
    
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    mysTableViewCell* cell = [self.mysTableView  dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.label1.text = @"我的收藏";
        cell.imageView1.image = [UIImage imageNamed:@"jinrujiantou"];
        
    } else {
        cell.label1.text = @"消息中心";
        cell.imageView1.image = [UIImage imageNamed:@"jinrujiantou"];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pushCollectViewSender" object:nil userInfo:nil];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
