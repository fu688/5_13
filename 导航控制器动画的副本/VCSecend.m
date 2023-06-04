//
//  VCSecend.m
//  导航控制器动画
//
//  Created by 付闯 on 2023/6/4.
//

#import "VCSecend.h"

@interface VCSecend ()

@end

@implementation VCSecend

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"控制器二";
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(40, 40, 300, 480);
    _imageView.image = [UIImage imageNamed:@"2..jpg"];
    [self.view addSubview:_imageView];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransition* ami = [CATransition animation];
    ami.duration = 1;
    ami.type = @"rippleEffect";
    ami.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:ami forKey:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
