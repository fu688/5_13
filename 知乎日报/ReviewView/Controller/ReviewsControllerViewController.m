//
//  ReviewsControllerViewController.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import "ReviewsControllerViewController.h"
#import "Manager.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface ReviewsControllerViewController ()

@end

@implementation ReviewsControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [[Manager shareManager] makeData4:^(ReviewsModel * _Nonnull shortReviewsModel) {
        self.model = shortReviewsModel;
        [[Manager shareManager] makeData5:^(LongReviewsModel * _Nonnull LongReviewsModel) {
           
            dispatch_async(dispatch_get_main_queue(), ^{
                self.reviewView = [[ReviewsView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
                self.reviewView.shortReviewsModel = self.model;
                self.reviewView.LongReviewsModel = LongReviewsModel;
                [self.view addSubview:self.reviewView];
                
                [self.reviewView.returnButton addTarget:self action:@selector(pressReturn) forControlEvents:UIControlEventTouchUpInside];
                
                NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.model, @"shortModel",LongReviewsModel,@"longModel", nil];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"commentsSender" object:nil userInfo:dictionary];
                
                
                
            });
        } error:^(NSError * _Nonnull error) {
                NSLog(@"请求失败");
        } andid:self.id];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    } andid:self.id];
}
- (void)pressReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
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
