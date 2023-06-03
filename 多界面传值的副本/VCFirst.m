//
//  VCFirst.m
//  多界面传值
//
//  Created by 付闯 on 2023/5/31.
//

#import "VCFirst.h"
#import "VCSecend.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)changeColor:(UIColor *)color {
    self.view.backgroundColor = color;
}
//点击屏幕推出视图控制器二
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    VCSecend* vc = [[VCSecend alloc] init];
    //将当前控制器作为代理对象赋值
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
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
