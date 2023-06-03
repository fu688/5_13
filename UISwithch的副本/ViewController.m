//
//  ViewController.m
//  UISwithch
//
//  Created by 付闯 on 2023/5/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//同步属性和成员变量
@synthesize mySwithch = _mySwithch;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mySwitch = [[UISwitch alloc] init];
    //位置XY可以改变
    //宽度和高度值无法改变
    _mySwitch.frame = CGRectMake(100, 100, 80, 40);
    //开关状态设置属性
    _mySwitch.on = YES;
    [_mySwitch setOn:YES];
    [_mySwitch setOn:YES animated:YES];//p2是否开启动画
    [self.view addSubview:_mySwitch];
    //设置开启状态的风格颜色
    [_mySwitch setOnTintColor:[UIColor purpleColor]];
    //设置圆按钮的风格颜色
    [_mySwitch setThumbTintColor:[UIColor blueColor]];
    //设置整体风格颜色
    [_mySwitch setTintColor:[UIColor redColor]];
    //向开关控件添加事件函数
    //p3状态发生变化时触发函数
    [_mySwitch  addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
}
- (void)swChange:(UISwitch*)sw {
    if (sw.on == YES) {
        NSLog(@"开关被打开");
    } else {
        NSLog(@"开关被关闭");
    }
    NSLog(@"开关状态发生变化");
}

@end
