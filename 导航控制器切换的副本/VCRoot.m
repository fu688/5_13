//
//  VCRoot.m
//  导航控制器切换
//
//  Created by 付闯 on 2023/5/29.
//

#import "VCRoot.h"
#import "VCSecond.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航栏的透明度
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor purpleColor];
    //设置导航栏的样式
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"根视图";
    UIBarButtonItem* next = [[UIBarButtonItem alloc] initWithTitle:@"下一级" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    self.navigationItem.rightBarButtonItem = next;
    
}
- (void)pressNext {
    //创建新的视图控制器
    VCSecond* vcSecond = [[VCSecond alloc] init];
    //使用当前视图控制器的导航控制器对象
    //vcSecond.modalPresentationStyle = UIModalPresentationFullScreen;
    //[self presentViewController:vcSecond animated:YES completion:nil];
    [self.navigationController pushViewController:vcSecond animated:YES];
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

