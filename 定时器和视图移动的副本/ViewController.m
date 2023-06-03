//
//  ViewController.m
//  定时器和视图移动
//
//  Created by 付闯 on 2023/5/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize  timer = _timer;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"启动定时器" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(preesStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton* btnstop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnstop.frame = CGRectMake(100, 200, 80, 40);
    [btnstop setTitle:@"停止定时器" forState:UIControlStateNormal];
    [btnstop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnstop];
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    //涌过父亲视图对象以及view的标签值获得相应的视图
    view.tag = 101;
    
}
- (void) preesStart{
    //NSTimer的类方法创建一个定时器并且启动这个定时器
    //返回一个新建好的定时器对象
    UIView* view02 = [self.view viewWithTag:101];
    view02.frame = CGRectMake(0, 0, 80, 80);
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
    }
}
- (void)updateTimer:(NSTimer*) timer {
    NSLog(@"test!!!name = %@",timer.userInfo);
    UIView* view01 = [self.view viewWithTag:101];
    view01.frame = CGRectMake(view01.frame.origin.x+1, view01.frame.origin.y+1, 80, 80);
}
-(void)pressStop {
    [_timer invalidate];
    _timer = nil;
}
@end
