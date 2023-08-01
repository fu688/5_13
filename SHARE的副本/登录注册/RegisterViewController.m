//
//  RegisterViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kaiji1"]];
    self.imageView.frame = self.view.bounds;
    //[self.view addSubview:self.imageView];
    
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    self.imageView1.frame = CGRectMake(121.5, 150, 150, 150);
    [self.view addSubview:self.imageView1];
    
    self.label = [[UILabel alloc] init];
    self.label.text = @"SHARE";
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:40];
    self.label.frame = CGRectMake(130, 320, 150, 40);
    [self.view addSubview:self.label];
    
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(46.5, 380, 300, 50);
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
    
    self.textFiled1  = [[UITextField alloc] init];
    self.textFiled1.frame = CGRectMake(46.5, 450, 300, 50);
    self.textFiled1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled1];
    
    self.textFiled2  = [[UITextField alloc] init];
    self.textFiled2.frame = CGRectMake(46.5, 520, 300, 50);
    self.textFiled2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled2];
    
    self.imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youxiang"]];
    self.textFiled.leftView  = self.imageView4;
    self.textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghu"]];
    self.textFiled1.leftView  = self.imageView2;
    self.textFiled1.leftViewMode = UITextFieldViewModeAlways;
    
    self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiesuo"]];
    self.textFiled2.leftView = self.imageView3;
    self.textFiled2.leftViewMode = UITextFieldViewModeAlways;
    
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(120, 590, 150, 40);
    [self.btn.layer setCornerRadius:8.0];
    [self.btn.layer setMasksToBounds:YES];
    [self.btn.layer setBorderWidth:1.0];
    [self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btn setTitle:@"确认注册" forState:UIControlStateNormal];
    [self.btn setTintColor:[UIColor whiteColor]];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btn addTarget:self action:@selector(pressNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}
- (void) pressNext {
    
    if ([self.textFiled1.text isEqualToString:@""] == YES || [self.textFiled2.text isEqualToString:@""] == YES || [self.textFiled.text isEqualToString:@""] == YES)
    {
        
        self.alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"输入项不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        
        [self.delegate registerReturn:self.textFiled1.text andPass:self.textFiled2.text];
    } else {
        for (int i = 0; i < self.array1.count; i++) {
            NSLog(@"----");
            NSLog(@"%@", self.array1[i]);
            if ([self.textFiled1.text isEqualToString:self.array1[i]]) {
                self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"账号已注册" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
                [self.alert addAction:action];
                [self presentViewController:self.alert animated:YES completion:nil];
                return;
            }
        }
        [self.delegate registerReturn:self.textFiled1.text andPass:self.textFiled2.text];
        [self dismissViewControllerAnimated:YES completion:nil];
        
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
