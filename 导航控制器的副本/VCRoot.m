//
//  VCRoot.m
//  导航控制器
//
//  Created by 付闯 on 2023/5/28.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    //设置导航栏的标题文字
    self.title = @"根视图";
    //设置导航元素项目的标题
    //如果navigationItem.title不为空，则设置为标题内容
    self.navigationItem.title = @"Title";
    //创建一个导航栏左侧的按钮
    //根据title文字来创建按钮
    //p1：按钮上的文字
    //p2：按钮风格
    //p3:事件拥有者
    //p4：按钮事件
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //将导航元素项目的左侧按钮赋值
    self.navigationItem.leftBarButtonItem = leftBtn;
    //创建导航栏右侧按钮
    //根据系统风格来创建按钮
    //只能指定风格样式，系统风格的按钮内容或标题文字不能改变
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 40)];
    label.text = @"test";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    //将任意类型的控件添加到导航按钮的方法
    UIBarButtonItem* item3 = [[UIBarButtonItem alloc] initWithCustomView:label];
    //创建按钮数组
    NSArray* arrayBtn = [NSArray arrayWithObjects:rightBtn, item3, nil];
    //将右侧按钮赋值
    self.navigationItem.rightBarButtonItems = arrayBtn;
}
- (void)pressLeft {
    NSLog(@"左侧按钮被按下");
}
- (void)pressRight {
    NSLog(@"右侧按钮被按下");
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
