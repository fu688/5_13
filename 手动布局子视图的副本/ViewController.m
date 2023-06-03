//
//  ViewController.m
//  手动布局子视图
//
//  Created by 付闯 on 2023/5/28.
//

#import "ViewController.h"
#import "superView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    superView* sView = [[superView alloc] init];
    sView.frame = CGRectMake(20, 20, 180, 280);
    [sView createSubViews];
    sView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sView];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(240, 480, 80, 40);
    [btn setTitle:@"放大" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressLarge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton* btn02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn02.frame = CGRectMake(240, 520, 80, 40);
    [btn02 setTitle:@"缩小" forState:UIControlStateNormal];
    [btn02 addTarget:self action:@selector(pressSmall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn02];
    sView.tag = 101;
}
- (void)pressLarge {
    superView* sView = (superView*)[self.view viewWithTag:101];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    sView.frame = CGRectMake(20, 20, 300, 400);
    [UIView commitAnimations];
}
- (void)pressSmall {
    superView* sView = (superView*)[self.view viewWithTag:101];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    sView.frame = CGRectMake(20, 20, 180, 280);
    [UIView commitAnimations];}

@end
