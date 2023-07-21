//
//  myTableViewCell2.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/20.
//

#import "MyTableViewCell2.h"
#import "MyTableViewCell3.h"
@implementation MyTableViewCell2

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
        self.sv.frame  = CGRectMake(20, 0, 350, 150);
        self.sv.pagingEnabled = YES;
        self.sv.scrollEnabled = YES;
        self.sv.contentSize = CGSizeMake(350 * 5, 150);
        for (int i = 0; i < 5; i++) {
            NSString* strName = [NSString stringWithFormat:@"?%d.jpg", i + 1];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* view = [[UIImageView alloc] initWithImage:image];
            view.frame = CGRectMake(350 * i, 0, 350, 150);
            [self.sv addSubview:view];
        }
        self.sv.contentOffset = CGPointMake(350, 0);
        self.mytimer = [[NSTimer alloc] init];
        self.mytimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timer) userInfo:nil repeats:YES];
        [self.contentView addSubview:self.sv];
    }
    if ([self.reuseIdentifier isEqualToString:@"111"]) {
        self.sv = [[UIScrollView alloc] init];
        self.sv.frame  = CGRectMake(20, 0, 350, 80);
        self.sv.scrollEnabled = YES;
        self.sv.contentSize = CGSizeMake(80 * 7, 40);
        NSArray* array = [NSArray arrayWithObjects:@"    直播", @"每日推荐", @" 收藏家", @" 排行榜", @" 有声书",@"数字专辑",@"    歌单", nil];
        for (int i = 0; i < 7; i++) {
            NSString* strName = [NSString stringWithFormat:@"；%d.png", i + 1];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* view = [[UIImageView alloc] initWithImage:image];
            view.frame = CGRectMake(80 * i, 10, 40, 40);
            self.label = [[UILabel alloc] init];
            self.label.text = array[i];
            self.label.font = [UIFont systemFontOfSize:10];
            self.label.textColor = [UIColor grayColor];
            self.label.frame = CGRectMake(80 * i, 60, 100, 10);
            [self.sv addSubview:view];
            [self.sv addSubview:self.label];
        }
        [self.contentView addSubview:self.sv];
    }
    if ([self.reuseIdentifier isEqualToString:@"222"]) {
        self.sv = [[UIScrollView alloc] init];
        self.sv.frame  = CGRectMake(20, 0, 350, 150);
        self.sv.scrollEnabled = YES;
        self.sv.contentSize = CGSizeMake(130 * 5, 40);
        NSArray* array = [NSArray arrayWithObjects:@"经典怀旧", @"那些你熟悉但猜不出名字", @" 嘴硬的小朋友只能偷偷难过", @"高燃巅峰对决", @" 带感纯音乐", nil];
        for (int i = 0; i < 5; i++) {
            NSString* strName = [NSString stringWithFormat:@"{%d.jpg", i + 1];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* view = [[UIImageView alloc] initWithImage:image];
            view.frame = CGRectMake(130 * i, 10, 120, 120);
            self.label = [[UILabel alloc] init];
            self.label.text = array[i];
            self.label.font = [UIFont systemFontOfSize:15];
            self.label.textColor = [UIColor grayColor];
            self.label.frame = CGRectMake(130 * i, 130, 100, 15);
            [self.sv addSubview:view];
            [self.sv addSubview:self.label];
        }
        [self.contentView addSubview:self.sv];
    }
    if ([self.reuseIdentifier isEqualToString:@"333"]) {
        self.sv = [[UIScrollView alloc] init];
        self.sv.frame  = CGRectMake(20, 0, 350, 260);
        self.sv.scrollEnabled = YES;
        self.sv.contentSize = CGSizeMake(350 * 2, 260);
        self.sv.scrollEnabled = YES;
        self.sv.pagingEnabled = YES;
        for (int i = 0; i < 2; i++) {
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(330 * i, 10, 320, 240) style:UITableViewStyleGrouped];
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
            [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"000"];
            [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"111"];
            [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"222"];
            [self.sv addSubview:self.tableView];
            
        }
        [self.contentView addSubview:self.sv];
    }
    return self;
}
- (void)timer {
    int num = _sv.contentOffset.x / 350;
    _sv.contentOffset = CGPointMake(350 * (num + 1), 0);
    if (num == 3) {
        _sv.contentOffset = CGPointMake(350 * 0, 0);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    return 80;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"120");
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MyTableViewCell3* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.row == 1) {
        MyTableViewCell3* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
        
    } else {
        MyTableViewCell3* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    }
}
@end
