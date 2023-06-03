//
//  ViewController.m
//  UIButton
//
//  Created by 付闯 on 2023/5/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)creatRectButton {
    //圆角类型btn
    //只能通过类方法创建buttonWithType
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"按钮1" forState:UIControlStateNormal];
    [btn setTitle:@"按下按钮" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    //设置图片颜色。不分状态，优先级没有setTitleColor高
    [btn setTintColor:[UIColor whiteColor]];
    //titleLabel实际是UILable对象
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:btn];
}
- (void) creatImageButton {
    //创建自定义类型btn
    UIButton* btnImage  = [UIButton buttonWithType:UIButtonTypeCustom];
    btnImage.frame = CGRectMake(100, 200, 50, 50);
    //两张图片加载
    UIImage* icon01 = [UIImage imageNamed:@"WechatIMG99.jpeg"];
    UIImage* icon02 = [UIImage imageNamed:@"WechatIMG100.jpeg"];
    //设置按钮图片
    [btnImage setImage:icon01 forState:UIControlStateNormal];
    [btnImage setImage:icon02 forState:UIControlStateHighlighted];
    [self.view addSubview:btnImage];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatRectButton];
    [self creatImageButton];
}


@end
