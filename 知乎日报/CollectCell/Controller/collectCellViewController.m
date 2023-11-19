//
//  collectCellViewController.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/10.
//

#import "collectCellViewController.h"
#import "Manager.h"
#import "ReviewsControllerViewController.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface collectCellViewController ()

@end

@implementation collectCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.collectCellView = [[CollectCellView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
    self.collectCellView.titleArray = self.titleArray;
    self.collectCellView.imageUrlArray = self.imageUrlArray;
    self.collectCellView.urlArray = self.urlArray;
    self.collectCellView.idArray = self.idArray;
    self.collectCellView.deriction = [self.k intValue];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"urlSendtoTopView" object:nil userInfo:nil];
    [self.view addSubview:self.collectCellView];
    
    for(UIButton* button in self.collectCellView.buttonarray) {
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    // Do any additional setup after loading the view.
}
- (void)pressButton:(UIButton*)btn {
    if (btn.tag == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCollectCell" object:nil userInfo:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (btn.tag == 1) {
        ReviewsControllerViewController* reviewsController = [[ReviewsControllerViewController alloc] init];
        reviewsController.modalPresentationStyle = NO;
        //self.model = self.dictionaryArray[0];
        reviewsController.id = self.idArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];
        [self presentViewController:reviewsController animated:YES completion:nil];
    } else if (btn.tag == 2 || btn.tag == 4) {
        //self.model = self.dictionaryArray[0];
        
        NSString* idString = self.idArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];
        
        if (btn.tag == 2) {
            int likesNum = [self.collectCellView.likesCountLabel.text intValue];
            likesNum++;
            self.collectCellView.likesCountLabel.text = [NSString stringWithFormat:@"%d", likesNum];
            [self.collectCellView.likesButton setImage:[UIImage imageNamed:@"a-24geshangchuan-20"] forState:UIControlStateNormal];
            [self insertLikesData:idString];
            btn.tag = 4;
        } else {
            int likesNum = [self.collectCellView.likesCountLabel.text intValue];
            likesNum--;
            self.collectCellView.likesCountLabel.text = [NSString stringWithFormat:@"%d", likesNum];
            [self.collectCellView.likesButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
            [self deleteLikesDate:idString];
            btn.tag = 2;
        }
    } else if (btn.tag == 3 || btn.tag == 6) {
        //self.model = self.dictionaryArray[0];
        
        NSString* idString = self.idArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];
        
        NSString* mainLable = self.titleArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];
        NSString* imageurl = self.imageUrlArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];
        NSString* url = self.urlArray[(int)self.collectCellView.topStoriesScrollView.contentOffset.x / (int)widt];        if (btn.tag == 3) {
            [self.collectCellView.keepButton setImage:[UIImage imageNamed:@"shoucangxuanzhong-2"] forState:UIControlStateNormal];
            [self insertCollectionData:mainLable andImage:imageurl andId:idString andUrl:url];
            btn.tag = 6;
        } else {
            [self.collectCellView.keepButton setImage:[UIImage imageNamed:@"shoucang-2"] forState:UIControlStateNormal];
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
        BOOL result = [self.collectionDataBase executeUpdate:@"INSERT INTO collectionData (mainLabel,imageURL,id,url) VALUES (?, ?, ?, ?);", mainLabel, imageUrl, idSyring];
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
