//
//  ViewController.m
//  UIView动画基础
//
//  Created by 付闯 on 2023/6/2.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(100, 100, 80, 80);
    _imageView.image = [UIImage imageNamed:@"1+.jpg"];
    [self.view addSubview:_imageView];
    UIButton* btnMove = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnMove.frame = CGRectMake(120, 360, 80, 40);
    [btnMove setTitle:@"移动" forState:UIControlStateNormal];
    [btnMove addTarget:self action:@selector(pressMove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMove];
    UIButton* btnScale = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnScale.frame = CGRectMake(120, 400, 80, 40);
    [btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    [btnScale addTarget:self action:@selector(pressScale) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnScale];
    
}
- (void)pressMove {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stop)];
    _imageView.frame = CGRectMake(300, 100, 10, 10);
    [UIView commitAnimations];
}
-(void)stop {
    NSLog(@"动画结束");
}
- (void)pressScale {
    
}
@end
