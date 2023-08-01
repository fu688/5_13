//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnRegister.frame = CGRectMake(120, 590, 150, 40);
    [self.btnRegister.layer setCornerRadius:8.0];
    [self.btnRegister.layer setMasksToBounds:YES];
    [self.btnRegister.layer setBorderWidth:1.0];
    [self.btnRegister.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnRegister setTitle:@"确认注册" forState:UIControlStateNormal];
    [self.btnRegister setTintColor:[UIColor whiteColor]];
    self.btnRegister.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btnRegister addTarget:self action:@selector(pressBtnRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnRegister];
    
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
    }
- (void) pressBtnRegister {
    
    if ([self.textFieldAccount.text isEqualToString:@""] == YES || [self.textFieldPassword.text isEqualToString:@""] == YES )
    {
        
        self.alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"输入项不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else {
        for (int i = 0; i < self.arrayAccount.count; i++) {
            NSLog(@"----");
            NSLog(@"%@", self.arrayAccount[i]);
            if ([self.textFieldAccount.text isEqualToString:self.arrayAccount[i]]) {
                self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"账号已注册" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
                [self.alert addAction:action];
                [self presentViewController:self.alert animated:YES completion:nil];
                return;
            }
        }
        [self.delegate registerReturn:self.textFieldAccount.text andPass:self.textFieldPassword.text];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    
}/*}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
