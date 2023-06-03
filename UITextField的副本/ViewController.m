//
//  ViewController.m
//  UITextField
//
//  Created by 付闯 on 2023/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textFiled = _textFiled;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textFiled = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(100, 100, 180, 40);
    self.textFiled.text = @"用户名";
    self.textFiled.font = [UIFont systemFontOfSize:15];
    self.textFiled.textColor = [UIColor blackColor];
    //设置边框风格
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    //设置虚拟键盘风格
    self.textFiled.keyboardType = UIKeyboardTypePhonePad;
    //提示文字信息
    //当Text属性为空，展示此条信息
    self.textFiled.placeholder = @"请输入用户名...";
    //是否作为密码输入
    //YES圆点加密
    //NO正常显示
    self.textFiled.secureTextEntry = YES;
    [self.view addSubview:self.textFiled];
    //self.textFiled.delagete = self;
}
//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息享用者
    [self.textFiled resignFirstResponder];
}
@end
