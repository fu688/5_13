//
//  TopStoryCellController.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import "TopStoryCellController.h"
#import "Manager.h"
#import "ReviewsControllerViewController.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface TopStoryCellController ()

@end

@implementation TopStoryCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.topstoriescontentsView = [[TopStoryCellView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
    
    self.topstoriescontentsView.urlarray = self.urlArray;
    self.topstoriescontentsView.deriction = [self.k intValue];
    self.topstoriescontentsView.dictionArray = self.dictionaryArray;
    self.topstoriescontentsView.lastDate = self.lastDate;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.urlArray, @"url", self.k, @"deriction",self.lastDate, @"lastDate",self.dictionaryArray, @"dictionaryArray", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"urlSendtoTopView" object:nil userInfo:dictionary];
    [self.view addSubview:self.topstoriescontentsView];
    for(UIButton* button in self.topstoriescontentsView.buttonarray) {
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    // Do any additional setup after loading the view.
}
- (void)pressButton:(UIButton*)btn {
    if (btn.tag == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (btn.tag == 1) {
        ReviewsControllerViewController* reviewsController = [[ReviewsControllerViewController alloc] init];
        reviewsController.modalPresentationStyle = NO;
        self.model = self.dictionaryArray[0];
        reviewsController.id = [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x / (int)widt] valueForKey:@"id"];
        [self presentViewController:reviewsController animated:YES completion:nil];
    } else if (btn.tag == 2 || btn.tag == 4) {
        self.model = self.dictionaryArray[0];
        
        NSString* idString = [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x / (int)widt] valueForKey:@"id"];
        
        if (btn.tag == 2) {
            int likesNum = [self.topstoriescontentsView.likesCountLabel.text intValue];
            likesNum++;
            self.topstoriescontentsView.likesCountLabel.text = [NSString stringWithFormat:@"%d", likesNum];
            [self.topstoriescontentsView.likesButton setImage:[UIImage imageNamed:@"a-24geshangchuan-20"] forState:UIControlStateNormal];
            [self insertLikesData:idString];
            btn.tag = 4;
        } else {
            int likesNum = [self.topstoriescontentsView.likesCountLabel.text intValue];
            likesNum--;
            self.topstoriescontentsView.likesCountLabel.text = [NSString stringWithFormat:@"%d", likesNum];
            [self.topstoriescontentsView.likesButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
            [self deleteLikesDate:idString];
            btn.tag = 2;
        }
    } else if (btn.tag == 3 || btn.tag == 6) {
        self.model = self.dictionaryArray[0];
        
        NSString* idString = [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x / (int)widt] valueForKey:@"id"];
        NSString* mainLable = [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x  / (int)widt] valueForKey:@"title"];
        NSString* imageurl =
        [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x  / (int)widt] valueForKey:@"image"];
        NSString* url = [self.model.top_stories[(int)self.topstoriescontentsView.topStoriesScrollView.contentOffset.x  / (int)widt] valueForKey:@"url"];
        
        if (btn.tag == 3) {
            [self.topstoriescontentsView.keepButton setImage:[UIImage imageNamed:@"shoucangxuanzhong-2"] forState:UIControlStateNormal];
            [self insertCollectionData:mainLable andImage:imageurl andId:idString andUrl:url];
            btn.tag = 6;
        } else {
            [self.topstoriescontentsView.keepButton setImage:[UIImage imageNamed:@"shoucang-2"] forState:UIControlStateNormal];
            [self deleteCollectionData:mainLable andImage:imageurl andId:idString andUrl:url];
            btn.tag = 3;
        }
    }
    
}
- (void)insertLikesData:(NSString*)string {
    NSString *goodDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString * fileName = [goodDoc stringByAppendingPathComponent:@"likes.sqlite"];
        self.likesDataBase = [FMDatabase databaseWithPath:fileName];
    if ([self.likesDataBase open]) {
        BOOL result = [self.likesDataBase executeUpdate:@"INSERT INTO likesData (id) VALUES (?);", string];
        if (!result) {
            NSLog(@"增加数据失败");
        } else {
            NSLog(@"增加数据成功");
        }
        [self.likesDataBase close];
    }
}
- (void)insertCollectionData:(NSString*) mainLabel andImage:(NSString*) imageUrl andId:(NSString*) idSyring andUrl:(NSString*)url {
    NSString* collectionDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [collectionDoc stringByAppendingPathComponent:@"collection1.sqlite"];
    
    self.collectionDataBase = [FMDatabase databaseWithPath:filename];
    if ([self.collectionDataBase open]) {
        BOOL result = [self.collectionDataBase executeUpdate:@"INSERT INTO collectionData (mainLabel,imageURL,id,url) VALUES (?, ?, ?, ?);", mainLabel, imageUrl, idSyring, url];
        if (!result) {
            NSLog(@"增加数据失败");
        } else {
            NSLog(@"增加数据成功");
        }
        [self.collectionDataBase close];
    }
}
- (void)deleteLikesDate:(NSString*)nowID {
    NSString *goodDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString * fileName = [goodDoc stringByAppendingPathComponent:@"likes.sqlite"];
        self.likesDataBase = [FMDatabase databaseWithPath:fileName];
    if ([self.likesDataBase open]) {
        NSString *sql = @"delete from likesData WHERE id = ?";
        BOOL result = [self.likesDataBase executeUpdate:sql, nowID];
            if (!result) {
                NSLog(@"数据删除失败");
            } else {
                NSLog(@"数据删除成功");
            }
            [self.likesDataBase close];
        }
}
- (void)deleteCollectionData:(NSString*) mainLabel andImage:(NSString*) imageUrl andId:(NSString*) idSyring andUrl:(NSString*) url{
    NSString* collectionDoc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* filename = [collectionDoc stringByAppendingPathComponent:@"collection1.sqlite"];
    
    self.collectionDataBase = [FMDatabase databaseWithPath:filename];
    if ([self.collectionDataBase open]) {
        NSString *sql = @"delete from collectionData WHERE id = ?";
        BOOL result = [self.collectionDataBase executeUpdate:sql, idSyring];
        BOOL result1 = [self.collectionDataBase executeUpdate:sql, mainLabel];
        BOOL result2 = [self.collectionDataBase executeUpdate:sql, imageUrl];
        BOOL result3 = [self.collectionDataBase executeUpdate:sql, url];
        if (!result) {
                    NSLog(@"数据删除失败");
                } else {
                    NSLog(@"数据删除成功");
                }
        if (!result1) {
                    NSLog(@"数据删除失败");
                } else {
                    NSLog(@"数据删除成功");
                }
        if (!result2) {
                    NSLog(@"数据删除失败");
                } else {
                    NSLog(@"数据删除成功");
                }
        if (!result3) {
                    NSLog(@"数据删除失败");
                } else {
                    NSLog(@"数据删除成功");
                }
        [self.collectionDataBase close];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
