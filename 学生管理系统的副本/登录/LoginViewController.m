//
//  LoginViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/28.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.textFieldAccount = [[UITextField alloc] init];
    self.textFieldAccount.frame = CGRectMake(46.5, 300, 300, 50);
    self.textFieldAccount.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFieldAccount];
    
    self.imageViewAccount = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghu"]];
    self.textFieldAccount.leftView = self.imageViewAccount;
    self.textFieldAccount.leftViewMode = UITextFieldViewModeAlways;
    
    self.textFieldPassword = [[UITextField alloc] init];
    self.textFieldPassword.frame = CGRectMake(46.5, 370, 300, 50);
    self.textFieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFieldPassword];
    
    self.imageViewPassword = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiesuo"]];
    self.textFieldPassword.leftView = self.imageViewPassword;
    self.textFieldPassword.leftViewMode = UITextFieldViewModeAlways;
    
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnLogin.frame = CGRectMake(96.5, 540, 100, 40);
    [self.btnLogin.layer setCornerRadius:8.0];
    [self.btnLogin.layer setMasksToBounds:YES];
    [self.btnLogin.layer setBorderWidth:1.0];
    [self.btnLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [self.btnLogin setTintColor:[UIColor whiteColor]];
    self.btnLogin.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btnLogin addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnLogin];
    
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnRegister.frame = CGRectMake(240.5, 540, 100, 40);
    [self.btnRegister.layer setCornerRadius:8.0];
    [self.btnRegister.layer setMasksToBounds:YES];
    [self.btnRegister.layer setBorderWidth:1.0];
    [self.btnRegister.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [self.btnRegister setTintColor:[UIColor whiteColor]];
    self.btnRegister.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btnRegister addTarget:self action:@selector(pressBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnRegister];
    
    self.arrayAccount = [NSMutableArray array];
    self.arrayPassword = [NSMutableArray array];
}
- (void)registerReturn:(NSString *)namestr andPass:(NSString *)passStr {
    [self.arrayAccount addObject:namestr];
    [self.arrayPassword addObject:passStr];
}
- (void)pressBtn1 {
    RegisterViewController* registerView = [[RegisterViewController alloc] init];
    registerView.arrayAccount = [NSMutableArray array];
    registerView.arrayPassword = [NSMutableArray array];
    [registerView.arrayAccount addObjectsFromArray:self.arrayAccount];
    [registerView.arrayPassword addObjectsFromArray:self.arrayPassword];
    //NSLog(@"%@", self.array1[0]);
    registerView.modalPresentationStyle = 0;
    registerView.delegate = self;
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void)pressBtn {
    int j  = 0;
    for (int i = 0; i < self.arrayAccount.count; i++) {
        if ([self.textFieldAccount.text isEqualToString:self.arrayAccount[i]] && [self.textFieldPassword.text isEqualToString:self.arrayPassword[i]]) {
            //NSLog(@"%@", self.array1[i]);
            j = 1;
        }
    }
    if (j == 0) {
        self.alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"账号或密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else {
        HomeViewController* homeView = [[HomeViewController alloc] init];
        UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
        NSArray<UIWindow *> *windows = windowScene.windows;
        UIWindow *window = windows.firstObject;
        window.rootViewController = homeView;
   }
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
