//
//  VCSecend.m
//  多界面传值
//
//  Created by 付闯 on 2023/5/31.
//

#import "VCSecend.h"

@interface VCSecend ()

@end

@implementation VCSecend

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    // Do any additional setup after loading the view.
    UIBarButtonItem* btnChange = [[UIBarButtonItem alloc] initWithTitle:@"改变颜色" style:UIBarButtonItemStyleDone target:self action:@selector(pressChange)];
    self.navigationItem.rightBarButtonItem = btnChange;
}
- (void)pressChange {
    //代理对象调用事件函数
    [_delegate changeColor:[UIColor redColor]];
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
