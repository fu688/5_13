//
//  ViewController01.m
//  UIViewControler的使用
//
//  Created by 付闯 on 2023/5/23.
//

#import "ViewController01.h"

@interface ViewController01 ()

@end

@implementation ViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}
//点击当前控制器二的界面屏幕时
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使当前控制器消失掉
    //p1是否有动画效果
    //p2结束后是否调用功能block块操作，不需要传nil即可
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
