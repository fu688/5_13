//
//  ViewController.m
//  登录界面
//
//  Created by 付闯 on 2023/5/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lbUserName = [[UILabel alloc] init];
    _lbUserName.frame = CGRectMake(20, 60, 80, 40);
    _lbUserName.text = @"用户名";
    _lbUserName.font = [UIFont systemFontOfSize:20];
    _lbUserName.textAlignment = NSTextAlignmentLeft;
    
    _lbPassword = [[UILabel alloc] init];
    _lbPassword.frame = CGRectMake(20, 140, 80, 40);
    _lbPassword.text = @"密码";
    _lbPassword.font = [UIFont systemFontOfSize:20];
    _lbPassword.textAlignment = NSTextAlignmentLeft;
    
    _tfUserName = [[UITextField alloc] init];
    _tfUserName.frame = CGRectMake(120, 60, 180, 40);
    _tfUserName.placeholder = @"请输入用户名";
    _tfUserName.keyboardType = UIKeyboardTypePhonePad;
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    _tfPassword = [[UITextField alloc] init];
    _tfPassword.frame = CGRectMake(120, 140, 180, 40);
    _tfPassword.placeholder = @"请输入密码";
    _tfPassword.keyboardType = UIKeyboardTypeDefault;
    _tfPassword.borderStyle = UITextBorderStyleRoundedRect;
    
    _btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btLogin.frame =CGRectMake(120, 300, 80, 40);
    [_btLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _btRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btRegister.frame =CGRectMake(120, 360, 80, 40);
    [_btRegister setTitle:@"注册" forState:UIControlStateNormal];
    [_btRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_lbUserName];
    [self.view addSubview:_lbPassword];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassword];
    [self.view addSubview:_btLogin];
    [self.view addSubview:_btRegister];
    
}
- (void)pressLogin {
    NSString* name = @"fuchuang";
    NSString* password = @"fu135453";
    NSString* strTextName = _tfUserName.text;
    NSString* strTextpass = _tfPassword.text;
    if ([name isEqualToString:strTextName] && [password isEqualToString:strTextpass]) {
        NSLog(@"用户名正确");
        UIAlertController* alView = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证成功， 登录成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        [alView addAction:action1];
        [self presentViewController:alView animated:YES completion:nil];
    } else {
        UIAlertController* alView = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证失败， 用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        [alView addAction:action1];
        [self presentViewController:alView animated:YES completion:nil];    }
}
- (void)pressRegister {
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_tfUserName resignFirstResponder];
    [_tfPassword resignFirstResponder];
}
@end
