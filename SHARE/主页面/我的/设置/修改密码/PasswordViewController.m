//
//  PasswordViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemGray6Color];
    // Do any additional setup after loading the view.
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(0, 110, 393, 50);
    self.textFiled.placeholder = @"6-20英文或数字结合";
    self.textFiled.textColor = [UIColor blackColor];
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
//    self.label = [[UILabel alloc] init];
//    self.label.text = @"旧密码";
//    self.textFiled.leftView  = self.label;
//    self.textFiled.leftViewMode = UITextFieldViewModeAlways;

//
    self.textFiled1  = [[UITextField alloc] init];
    self.textFiled1.frame = CGRectMake(0, 170, 393, 50);
    self.textFiled1.placeholder = @"6-20英文或数字结合";
    self.textFiled1.textColor = [UIColor blackColor];
    self.textFiled1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled1];
//    self.label1 = [[UILabel alloc] init];
//    self.label1.text = @"新密码";
//    self.textFiled1.leftView  = self.label;
//    self.textFiled1.leftViewMode = UITextFieldViewModeAlways;

    self.textFiled2  = [[UITextField alloc] init];
    self.textFiled2.frame = CGRectMake(0, 230, 393, 50);
    self.textFiled2.placeholder = @"请再次输入新密码";
    self.textFiled2.textColor = [UIColor blackColor];
    self.textFiled2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled2];
//    self.label2 = [[UILabel alloc] init];
//    self.label2.text = @"确认密码";
//    self.textFiled2.leftView  = self.label;
//    self.textFiled2.leftViewMode = UITextFieldViewModeAlways;

    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(146.5, 300, 100, 40);
    [self.btn.layer setCornerRadius:8.0];
    [self.btn.layer setMasksToBounds:YES];
    [self.btn.layer setBorderWidth:1.0];
    [self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btn setTitle:@"确定" forState:UIControlStateNormal];
    [self.btn setTintColor:[UIColor whiteColor]];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}
- (void) pressBtn {
    if ([self.textFiled.text isEqualToString:@"" ]|| [self.textFiled2.text isEqualToString:@""] || [self.textFiled1.text isEqualToString:@""]) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"输入项不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];    }
    else if ([self.textFiled1.text isEqualToString:self.textFiled2.text]) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"确认密码不相同，重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
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
