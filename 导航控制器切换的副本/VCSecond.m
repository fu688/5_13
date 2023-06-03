//
//  VCSecond.m
//  导航控制器切换
//
//  Created by 付闯 on 2023/5/29.
//

#import "VCSecond.h"
#import "VCThird.h"
@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"视图二";
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithTitle:@"下一级"style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    self.navigationItem.rightBarButtonItem = btnNext;
}
- (void)pressNext {
    VCThird* vcThird = [[VCThird alloc] init];
    //推入第三个视图控制器
    [self.navigationController pushViewController:vcThird animated:YES];
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
