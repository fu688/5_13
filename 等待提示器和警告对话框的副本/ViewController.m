//
//  ViewController.m
//  等待提示器和警告对话框
//
//  Created by 付闯 on 2023/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize alert = _alert;
@synthesize activityIndicator = _activityIndicator;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (int i = 0; i < 2; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame = CGRectMake(100, 100 + 100 * i, 100, 40);
        if (i == 0) {
            [btn setTitle:@"警告对话框" forState:UIControlStateNormal];
        } else if (i == 1) {
            [btn setTitle:@"等待提示器" forState:UIControlStateNormal];
        }
        btn.tag = 101 + i;
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
- (void) pressBtn:(UIButton*) btn {
    if (btn.tag == 101) {
        //警告对话框的创建
        _alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"你的手机电量过低，即将关机，请及时连接充电器" preferredStyle:UIAlertControllerStyleAlert];
        //对话框的按键信息的显示
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction* action) {}];
        [_alert addAction:action1];
        [_alert addAction:action2];
        [self presentViewController:_alert animated:YES completion:nil];
    } else if (btn.tag == 102) {
        //创建等待提示器
        //宽度和高度不可变更
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 300, 80, 80)];
        //设置
        _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        [self.view addSubview:_activityIndicator];
        //self.view.backgroundColor = [UIColor blackColor];
        //启动动画并显示
        [_activityIndicator startAnimating];
        //停止等待对话并隐藏
        //[_activityIndicator stopAnimating];
        
    }
}

@end
