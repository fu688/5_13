//
//  VCRoot.m
//  导航栏和工具栏
//
//  Created by 付闯 on 2023/5/29.
//

#import "VCRoot.h"
#import "VCSecend.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    //设置导航栏风格颜色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //将风格设为不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //设置导航元素项目按钮的风格颜色
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    self.title = @"根视图";
    UIBarButtonItem* btn = [[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.translucent = NO;
    //创建三个工具栏按钮
    UIBarButtonItem* btn01 = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem* btn02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(pressNext)];
    UIButton* btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnImage setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    btnImage.frame = CGRectMake(0, 0, 60, 60);
    //固定宽度占位按钮
    UIBarButtonItem* btnF01 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    btnF01.width = 60;
    //创建自动计算宽度按钮
    UIBarButtonItem* btnF02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* btn03 = [[UIBarButtonItem alloc] initWithCustomView:btnImage];
    //按钮数组的创建
    NSArray* arrayBtns = [NSArray arrayWithObjects:btn01, btnF02, btn02, btnF02, btn03, nil];
    self.toolbarItems = arrayBtns;
    
}
- (void)pressNext {
    VCSecend* vcSecend = [[VCSecend alloc] init];
    [self.navigationController pushViewController:vcSecend animated:YES];
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
