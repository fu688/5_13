//
//  CollectViewController.m
//  知乎日报
//
//  Created by 付闯 on 2023/11/6.
//

#import "CollectViewController.h"
#import "collectCellViewController.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@interface CollectViewController ()

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView = [[CollectView alloc] initWithFrame:CGRectMake(0, 0,widt,heigh)];
    [self.view addSubview:self.collectionView];
    [self.collectionView.returnButton addTarget:self action:@selector(pressReturnButton) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushCollectCell) name:@"pushCollectCell" object:nil];
}
- (void)pressReturnButton {
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pushCollectCell {
    collectCellViewController* collectCellController = [[collectCellViewController alloc] init];
    collectCellController.titleArray = self.collectionView.titleArray;
    collectCellController.imageUrlArray = self.collectionView.imageUrlArray;
    collectCellController.idArray = self.collectionView.idArray;
    collectCellController.urlArray = self.collectionView.urlArray;
    collectCellController.k = self.collectionView.index;
    collectCellController.modalPresentationStyle = NO;
    [self presentViewController:collectCellController animated:YES completion:nil];
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
