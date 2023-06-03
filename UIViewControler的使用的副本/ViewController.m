//
//  ViewController.m
//  UIViewControler的使用
//
//  Created by 付闯 on 2023/5/23.
//

#import "ViewController.h"
#import "ViewController01.h"
@interface ViewController ()

@end

@implementation ViewController
//当屏幕被点击时调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建视图控制器二
    ViewController01* vc = [[ViewController01 alloc] init];
    //显示一个新的视图控制器到屏幕上
    //p1新的视图控制器对象
    //p2使用动画切换动画效果
    //p3切换结束后功能调用，不需要传nil即可
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"第一次加载视图");
}
//视图即将显示时调用此函数
//视图分为1，显示前（不显示）2，正在处于显示状态 3，已经被隐藏
//参数：表示是否用动画切换后消失
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewwillApper,视图即将显示");
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"视图已经显示");
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"视图即将消失");
}
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"视图已经消失");
}
@end
