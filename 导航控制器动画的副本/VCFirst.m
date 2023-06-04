//
//  VCFirst.m
//  导航控制器动画
//
//  Created by 付闯 on 2023/6/4.
//

#import "VCFirst.h"
#import "VCSecend.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(40, 40, 300, 480);
    _imageView.image = [UIImage imageNamed:@"1..jpg"];
    [self.view addSubview:_imageView];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //定义一个动画变化对象，层动画对象
    //类方法获取动画对象
    CATransition* amin = [CATransition animation];
    //设置动画的时间长度
    amin.duration = 1;
    //设置动画的类型，决定动画的效果形式
    amin.type = @"cube";
    //设置动画的子类型，例如动画的方向
    amin.subtype = kCATransitionFromRight;
   //设置动画的轨迹类型
    amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //将动画设置对象添加到动画上
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
    VCSecend* vcSecend = [[VCSecend alloc] init];
    [self.navigationController pushViewController:vcSecend animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
