//
//  CollectCellView.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/10.
//

#import "CollectCellView.h"
#import "story_extralModel.h"
//#import "TopStoriesContentsViewController.h"
#import "Manager.h"
#import "Masonry.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation CollectCellView
- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.buttonarray = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateRecevid:) name:@"urlSendtoTopView" object:nil];
    self.backgroundColor = [UIColor whiteColor];
    self.topStoriesScrollView = [[UIScrollView alloc] init];
    self.topStoriesScrollView.delegate = self;
    [self addSubview:self.topStoriesScrollView];
    
    self.buttomView  = [[UIView alloc] init];
    self.buttomView.backgroundColor = [UIColor systemGray6Color];
    [self addSubview:self.buttomView];
    [self.buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(heigh - 100);
        make.left.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(100);
    }];
    UIImageView* iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shuxian"]];
    [self.buttomView addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttomView).offset(10);
        make.left.equalTo(self.buttomView).offset(40);
        make.width.offset(30);
        make.height.offset(30);
    }];
    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reviewsVButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.keepButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    self.upLoadButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonarray addObject:self.returnButton];
    [self.buttonarray addObject:self.reviewsVButton];
    [self.buttonarray addObject:self.likesButton];
    [self.buttonarray addObject:self.keepButton];
    [self.buttonarray addObject:self.upLoadButton];
    
    
    NSArray* buttonImageNameArray = [NSArray arrayWithObjects:@"fanhui1-copy",@"pinglun1", @"good", @"shoucang-2", @"shangchuandaochu", nil];
    
      for (int j = 0; j < 5; j++) {
       self.button = self.buttonarray[j];
       [self.button setImage:[UIImage imageNamed:buttonImageNameArray[j]] forState:UIControlStateNormal];
          self.button.tag = j;
       //self.button.tag = 100 + self.n;
       [self.buttomView addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buttomView).offset(10);
        make.left.equalTo(self.buttomView).offset(10 + widt / 5 * j);
        make.width.offset(30);
        make.height.offset(30);
       }];
      }
    
    return self;
}
-(void)dateRecevid:(NSNotification*)sender {
    //self.model = self.dictionArray[0];
    self.n = 0;
    self.scrollArray = [NSMutableArray array];
    [self.scrollArray addObject:[NSString stringWithFormat:@"%d",self.deriction]];

    [self likesAndCollectReload:self.idArray[self.deriction]];
    [[Manager shareManager] makeData3:^(story_extralModel * _Nonnull story_extraModel) {
            self.likesCountString = story_extraModel.popularity;
            self.reviewsCountString = story_extraModel.comments;
        
            self.likesCountLabel = [[UILabel alloc] init];
            self.likesCountLabel.font = [UIFont systemFontOfSize:10];
        if (self.flage1 == 1) {
          self.likesCountLabel.text = [NSString stringWithFormat:@"%d",[self.likesCountString intValue] + 1] ;
        } else {
        self.likesCountLabel.text = self.likesCountString;
        }
        //self.likesCountLabel.text = self.likesCountString;
            self.likesCountLabel.textColor = [UIColor blackColor];
            [self.buttomView addSubview:self.likesCountLabel];
            [self.likesCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.buttomView).offset(10);
                make.left.equalTo(self.buttomView).offset(10 + widt / 5 * 2 + 30 + 5);
                make.width.offset(30);
                make.height.offset(10);
            }];
            
            self.reviewsCountLabel = [[UILabel alloc] init];
            self.reviewsCountLabel.font = [UIFont systemFontOfSize:10];
            self.reviewsCountLabel.textColor = [UIColor blackColor];
            self.reviewsCountLabel.text = self.reviewsCountString;
            [self.buttomView addSubview:self.reviewsCountLabel];
            [self.reviewsCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.buttomView).offset(10);
                make.left.equalTo(self.buttomView).offset(10 + widt / 5 * 1 + 30 + 5);
                make.width.offset(30);
                make.height.offset(10);
            }];
        } error:^(NSError * _Nonnull error) {
            NSLog(@"请求失败");
        } andid:self.idArray[self.deriction]];
    
        self.topStoriesScrollView.frame = CGRectMake(0, 0, widt, heigh);
        self.topStoriesScrollView.pagingEnabled = YES;
        self.topStoriesScrollView.scrollEnabled = YES;
        self.topStoriesScrollView.contentSize = CGSizeMake(widt * self.urlArray.count, heigh);
        self.topStoriesScrollView.contentOffset = CGPointMake(widt * self.deriction, 0);
            self.wkWebView = [[WKWebView alloc] init];
            [self.topStoriesScrollView addSubview:self.wkWebView];
            [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topStoriesScrollView).offset(50);
            make.left.equalTo(self.topStoriesScrollView).offset(self.deriction * widt);
            make.width.offset(widt);
            make.height.offset(heigh - 150);
        }];
        NSURL* url = [NSURL URLWithString:self.urlArray[self.deriction]];
        NSURLRequest* requset = [[NSURLRequest alloc] initWithURL:url];
        [self.wkWebView loadRequest:requset];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ((int)self.topStoriesScrollView.contentOffset.x % (int)widt == 0) {
        
        [self likesAndCollectReload:self.idArray[(int)self.topStoriesScrollView.contentOffset.x / (int)widt]];
    

        [[Manager shareManager] makeData3:^(story_extralModel * _Nonnull story_extraModel) {
                self.likesCountString = story_extraModel.popularity;
            self.reviewsCountString = story_extraModel.comments;
            if (self.flage1 == 1) {
              self.likesCountLabel.text = [NSString stringWithFormat:@"%d",[self.likesCountString intValue] + 1] ;
            } else {
            self.likesCountLabel.text = self.likesCountString;
            }
            
                self.reviewsCountLabel.text = self.reviewsCountString;
            } error:^(NSError * _Nonnull error) {
                NSLog(@"请求失败");
            } andid:self.idArray[(int)self.topStoriesScrollView.contentOffset.x / (int)widt]];
        
        int n = 0;
        for(int i = 0; i < self.scrollArray.count; i++) {
            if ([[NSString stringWithFormat:@"%d",(int)self.topStoriesScrollView.contentOffset.x / (int)widt] isEqualToString:self.scrollArray[i]]) {
                n = 1;
            }
        }
        if (n == 1) {
            return;
        } else {
            [self.scrollArray addObject:[NSString stringWithFormat:@"%d",(int)self.topStoriesScrollView.contentOffset.x / (int)widt]];
        }
        self.wkWebView = [[WKWebView alloc] init];
        [self.topStoriesScrollView addSubview:self.wkWebView];
        [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topStoriesScrollView).offset(50);
        make.left.equalTo(self.topStoriesScrollView).offset((int)self.topStoriesScrollView.contentOffset.x / (int)widt * widt);
        make.width.offset(widt);
        make.height.offset(heigh - 150);
    }];
    NSURL* url = [NSURL URLWithString:self.urlArray[(int)self.topStoriesScrollView.contentOffset.x / (int)widt]];
    NSURLRequest* requset = [[NSURLRequest alloc] initWithURL:url];
        [self.wkWebView loadRequest:requset];
        
    }
}
- (void)likesAndCollectReload:(NSString*) nowIdSting{
    self.flage1 = 0;
    self.flage2 = 0;
    NSString* collectionDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [collectionDoc stringByAppendingPathComponent:@"collection1.sqlite"];
    
    self.collectionDataBase = [FMDatabase databaseWithPath:filename];
    if ([self.collectionDataBase open]) {
        FMResultSet* collectionResultSet = [self.collectionDataBase executeQuery:@"SELECT * FROM collectionData"];
        while ([collectionResultSet next]) {
            NSString* idString = [collectionResultSet stringForColumn:@"id"];
            if ([nowIdSting isEqualToString:idString]) {
                self.flage1 = 1;
                self.keepButton.tag = 6;
                [self.keepButton setImage:[UIImage imageNamed:@"shoucangxuanzhong-2"] forState:UIControlStateNormal];
            }
        }
        [self.collectionDataBase close];
    }
    if (self.flage1 == 0) {
        self.keepButton.tag  = 3;
        [self.keepButton setImage:[UIImage imageNamed:@"shoucang-2"] forState:UIControlStateNormal];
    }
    
    NSString *goodDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString * fileName = [goodDoc stringByAppendingPathComponent:@"likes.sqlite"];
        self.likesDataBase = [FMDatabase databaseWithPath:fileName];
    if ([self.likesDataBase open]) {
        // 1.执行查询语句
        FMResultSet *likesResultSet = [self.likesDataBase executeQuery:@"SELECT * FROM likesData"];
        // 2.遍历结果
        while ([likesResultSet next]) {
            NSString* idString1 = [likesResultSet stringForColumn:@"id"];
            if ([nowIdSting isEqualToString:idString1]) {
                self.flage2 = 1;
                self.likesButton.tag = 4;
                [self.likesButton setImage:[UIImage imageNamed:@"a-24geshangchuan-20"] forState:UIControlStateNormal];
            }
        }
        [self.likesDataBase close];
    }
    if (self.flage2 == 0) {
        self.likesButton.tag = 2;
        [self.likesButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
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
