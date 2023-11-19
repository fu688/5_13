//
//  ContentsViewController.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/15.
//

#import "ContentsViewController.h"
#import "TopStoriesContentsViewController.h"
#import "TopStoryCellController.h"
#import "MysViewController.h"
#import "Manager.h"
#import "ContentsModel.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface ContentsViewController ()

@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*self.contentsView = [[ContentsView alloc] init];
    self.contentsView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.contentsView];*/

    UINavigationBarAppearance* apperance = [UINavigationBarAppearance new];
    [apperance configureWithOpaqueBackground];
    apperance.backgroundColor = [UIColor whiteColor];
    apperance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = apperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    UIImageView* mysImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG119"]];
    mysImage.layer.masksToBounds = YES;
    mysImage.frame = CGRectMake(widt - 60, 0, 40, 40);
    mysImage.layer.cornerRadius = mysImage.frame.size.width / 2.0;
    mysImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressMysImage)];
    [mysImage addGestureRecognizer:singleTap];
    
    [self.navigationController.navigationBar addSubview:mysImage];
    UILabel* title = [[UILabel alloc] init];
    title.text = @"知乎日报";
    title.frame = CGRectMake(100, 10, 200, 25);
    title.font = [UIFont systemFontOfSize:25];
    [self.navigationController.navigationBar addSubview:title];
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    
    UILabel* dayLabel = [[UILabel alloc] init];
    dayLabel.text = [dateString substringFromIndex:3];
    dayLabel.font = [UIFont systemFontOfSize:20];
    dayLabel.frame = CGRectMake(35, 0, 40, 20);
    [self.navigationController.navigationBar addSubview:dayLabel];
    
    UILabel* monthLabel = [[UILabel alloc] init];
    NSArray* array = [NSArray arrayWithObjects:@"一月",@"二月",@"三月", @"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月", @"十二月", nil];
    monthLabel.text = array[[[dateString substringToIndex:2] intValue] - 1];
    monthLabel.font = [UIFont systemFontOfSize:15];
    monthLabel.frame = CGRectMake(30, 25, 50, 15);
    [self.navigationController.navigationBar addSubview:monthLabel];
    
    UIImageView* iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shuxian"]];
    iconImage.frame = CGRectMake(60, 0, 40, 40);
    [self.navigationController.navigationBar addSubview:iconImage];
    
    [[Manager shareManager] makeData:^(ContentsModel * _Nonnull ViewModel) {
        self.contentsModel = ViewModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self addUI];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    //[self.view addSubview:self.contentsView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(urlRecevid1:) name:@"TopStoryurlSender" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(urlRecevid:) name:@"StoryurlSender" object:nil];
}
- (void)addUI {
    self.contentsView = [[ContentsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.contentsView];
    self.dictionary = [NSDictionary dictionaryWithObject:self.contentsModel forKey:@"storyModel"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fistSender" object:nil userInfo:self.dictionary];
}
- (void)pressMysImage {
    MysViewController* mysViewController  = [[MysViewController alloc] init];
    mysViewController.modalPresentationStyle = NO;
    [self presentViewController:mysViewController animated:YES completion:nil];
    
}
- (void)urlRecevid:(NSNotification*)sender {
    TopStoriesContentsViewController* topStoriesController  = [[TopStoriesContentsViewController alloc] init];
    topStoriesController.urlArray = self.contentsView.urlArray;
    topStoriesController.idArray = self.contentsView.idArray;
    topStoriesController.k = self.contentsView.num2;
    topStoriesController.lastDate = self.contentsView.lastDate;
    topStoriesController.dictionaryArray = self.contentsView.dictinaryArray;
    topStoriesController.modalPresentationStyle = NO;
    [self presentViewController:topStoriesController animated:YES completion:nil];
}
- (void)urlRecevid1:(NSNotification*)sender {
    TopStoryCellController* topStoryCellController = [[TopStoryCellController alloc] init];
    topStoryCellController.urlArray = self.contentsView.urlArray;
    topStoryCellController.idArray = self.contentsView.idArray;
    topStoryCellController.k = self.contentsView.num1;
    topStoryCellController.dictionaryArray = self.contentsView.dictinaryArray;
    topStoryCellController.modalPresentationStyle = NO;
    [self presentViewController:topStoryCellController animated:YES completion:nil];
}
/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    } else {
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return widt;
    }
    return 120;
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
