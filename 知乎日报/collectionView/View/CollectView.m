//
//  CollectView.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/6.
//

#import "CollectView.h"
#import "Masonry.h"
#import "storiesTableViewCell.h"
#import<SDWebImage/UIImageView+WebCache.h>
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation CollectView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
   
    
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(100);
    }];
    
    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.returnButton setImage:[UIImage imageNamed:@"fanhui1-copy"] forState:UIControlStateNormal];
    [self.topView addSubview:self.returnButton];
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView).offset(10);
        make.top.equalTo(self.topView).offset(50);
        make.width.offset(30);
        make.height.offset(30);
    }];

    self.titlelabel = [[UILabel alloc] init];
    self.titlelabel.font = [UIFont systemFontOfSize:20];
    self.titlelabel.textColor = [UIColor blackColor];
    self.titlelabel.text = @"收藏";
    [self.topView addSubview:self.titlelabel];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView).offset(widt / 2 - 25);
        make.top.equalTo(self.topView).offset(60);
        make.width.offset(50);
        make.height.offset(20);
    }];
    NSLog(@"3");
    
    self.storiesTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
    self.storiesTableView.delegate = self;
    self.storiesTableView.dataSource = self;
    self.storiesTableView.estimatedRowHeight = 100;
    self.storiesTableView.rowHeight = UITableViewAutomaticDimension;
    [self addSubview:self.storiesTableView];
    [self.storiesTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(100);
        make.width.offset(widt);
        make.height.offset(heigh - 100);
    }];
    
    [self.storiesTableView registerClass:[storiesTableViewCell class] forCellReuseIdentifier:@"111"];
    //[self.storiesTableView registerClass:[storiesTableViewCell class] forCellReuseIdentifier:@"222"];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentsRecevid:) name:@"commentsSender" object:nil];
    [self twoArrayInit];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCollectCell) name:@"reloadCollectCell" object:nil];
    
    return self;
    
}
- (void)reloadCollectCell{
    [self twoArrayInit];
    [self.storiesTableView reloadData];
}
- (void)twoArrayInit {
    self.titleArray = [NSMutableArray array];
    self.imageUrlArray = [NSMutableArray array];
    self.idArray = [NSMutableArray array];
    self.urlArray = [NSMutableArray array];
    NSString* collectionDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [collectionDoc stringByAppendingPathComponent:@"collection1.sqlite"];
    
    self.collectionDataBase = [FMDatabase databaseWithPath:filename];
    if ([self.collectionDataBase open]) {
        FMResultSet* collectionResultSet = [self.collectionDataBase executeQuery:@"SELECT * FROM collectionData"];
        while ([collectionResultSet next]) {
            NSString* idString = [collectionResultSet stringForColumn:@"id"];
            [self.idArray addObject:idString];
            [self.titleArray addObject:[collectionResultSet stringForColumn:@"mainLabel"]];
            [self.imageUrlArray addObject:[collectionResultSet stringForColumn:@"imageURL"]];
            [self.urlArray addObject:[collectionResultSet stringForColumn:@"url"]];
        }
        [self.collectionDataBase close];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        storiesTableViewCell* cell = [self.storiesTableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.storyTitleLabel.text = self.titleArray[indexPath.row];
        NSString* imageUrl  = self.imageUrlArray[indexPath.row];
        [cell.storyImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"defalut"]];
        return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.index = [NSNumber numberWithInt:(int)indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushCollectCell" object:nil userInfo:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
