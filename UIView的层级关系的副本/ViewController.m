//
//  ViewController.m
//  UIView的层级关系
//
//  Created by 付闯 on 2023/5/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* view01 = [[UIView alloc] init];
    view01.frame = CGRectMake(100, 100, 150, 150);
    view01.backgroundColor = [UIColor blueColor];
    UIView* view02 = [[UIView alloc] init];
    view02.frame = CGRectMake(125, 125, 150, 150);
    view02.backgroundColor = [UIColor purpleColor];
    UIView* view03 = [[UIView alloc] init];
    view03.frame = CGRectMake(150, 150, 150, 150);
    view03.backgroundColor = [UIColor greenColor];
    //按添加顺序绘制，还会覆盖
    [self.view addSubview:view01];
    [self.view addSubview:view02];
    [self.view addSubview:view03];
    //将某个视图调到最前面
    [self.view bringSubviewToFront:view01];
    //将某个视图调整到最后面
    [self.view sendSubviewToBack:view03];
    //subView:管理所有self.View的子视图的数组
    //可以通过它找到子视图
    //最前面的视图下表为0；
    UIView* viewFront = self.view.subviews[2];
    UIView* viewBack = self.view.subviews[0];
    if (viewFront == view01) {
        NSLog(@"相等");
    }
    [view01 removeFromSuperview];
    
}


@end
