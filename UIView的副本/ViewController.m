//
//  ViewController.m
//  UIView
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
    //UIView对象是一个视图对象
    //屏幕上能看到的对象都是UIView的子类，继承于UIView
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 50);
    view.backgroundColor = [UIColor purpleColor];
    //将新建的视图添加到父类视图上
    //将新建视图显示到屏幕上
    //将视图作为父亲视图的子视图管理起来
    [self.view addSubview: view];
    //是否隐藏
    view.hidden = NO;
    //设置透明度
    //1不透明，0透明，0.5半透明
    view.alpha = 1;
    self.view.backgroundColor = [UIColor clearColor];
    //是否显示不透明
    view.opaque = NO;
    //将自己从父亲视图删除
    //[view removeFromSuperview];
}


@end
