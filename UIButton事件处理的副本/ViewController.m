//
//  ViewController.m
//  UIButton事件处理
//
//  Created by 付闯 on 2023/5/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)creatBtn {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 80);
    [btn setTitle:@"按钮1" forState:UIControlStateNormal];
    //这里的self代表ViewController对象
    //如果满足后面事件，则调用前面该对象函数
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(touchdown) forControlEvents:UIControlEventTouchDown];
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(200, 100, 80, 80);
    [self.view addSubview:btn2];
    //多个btn可以使用同一个事件函数
    [btn2 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1;
    btn2.tag = 2;
    
}
/*- (void)pressBtn2 {
    NSLog(@"按钮2按下");
}*/
- (void)touchdown {
    NSLog(@"按钮被触碰");
}
- (void)pressBtn:(UIButton*) btn {
    if (btn.tag == 1) {
        NSLog(@"按钮1被按下");
    }
    if (btn.tag == 2) {
        NSLog(@"按钮2被按下");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatBtn];
}


@end
