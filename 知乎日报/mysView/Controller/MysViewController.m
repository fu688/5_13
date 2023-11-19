//
//  MysViewController.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/21.
//

#import "MysViewController.h"
#import "CollectViewController.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface MysViewController ()

@end

@implementation MysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.mysView = [[MysView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
    [self.view addSubview:self.mysView];
    [self.mysView.returnButton addTarget:self action:@selector(pressReturnButton) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushCollectView) name:@"pushCollectViewSender" object:nil];
    
}
- (void)pressReturnButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pushCollectView {
    CollectViewController* collectViewController = [[CollectViewController alloc] init];
    collectViewController.modalPresentationStyle = NO;
    [self presentViewController:collectViewController animated:YES completion:nil];
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
