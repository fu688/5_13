//
//  ViewController.m
//  UISider
//
//  Created by 付闯 on 2023/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize progressView = _progressView;
@synthesize slider =_slider;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //不能添加事件函数
    _progressView = [[UIProgressView alloc] init];
    //进度条的高度不可以改变
    _progressView.frame = CGRectMake(10, 100, 300, 40);
    _progressView.progressTintColor = [UIColor redColor];
    _progressView.trackTintColor = [UIColor blackColor];
    //进度值
    //最大值为1
    _progressView.progress = 0.5;
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    [self.view addSubview:_progressView];
    _slider = [[UISlider alloc] init];
    //进度条的高度不可以改变
    _slider.frame = CGRectMake(10, 200,300, 40);
    _slider.maximumValue = 100;
    //最小值可以为负值
    _slider.minimumValue = 0;
    //设置滑动条的滑块位置float值
    _slider.value = 50;
    //左侧滑条背景颜色
    _slider.minimumTrackTintColor = [UIColor blueColor];
    //右侧滑条背景颜色
    _slider.maximumTrackTintColor = [UIColor greenColor];
    //设置滑块颜色
    _slider.thumbTintColor = [UIColor orangeColor];
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _slider];
    
}
- (void)pressSlider {
    _progressView.progress = (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
    NSLog(@"value = %f", _slider.value);
}

@end
