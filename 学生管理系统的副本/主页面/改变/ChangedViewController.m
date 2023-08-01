//
//  ChangedViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import "ChangedViewController.h"

@interface ChangedViewController ()

@end

@implementation ChangedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.textFieldName = [[UITextField alloc] init];
    self.textFieldName.frame = CGRectMake(46.5, 430, 300, 50);
    self.textFieldName.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldName.text = self.str;
    [self.view addSubview:self.textFieldName];
    
    self.imageViewName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghu"]];
    self.textFieldName.leftView = self.imageViewName;
    self.textFieldName.leftViewMode = UITextFieldViewModeAlways;
    
    self.textFieldClass = [[UITextField alloc] init];
    self.textFieldClass.frame = CGRectMake(46.5, 500, 300, 50);
    self.textFieldClass.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFieldClass];
    
    self.imageViewClass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji"]];
    self.textFieldClass.leftView = self.imageViewClass;
    self.textFieldClass.leftViewMode = UITextFieldViewModeAlways;
    
    self.textFieldScore  = [[UITextField alloc] init];
    self.textFieldScore.frame = CGRectMake(46.5, 570, 300, 50);
    self.textFieldScore.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFieldScore];
    
    self.imageViewScore = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fenshu"]];
    self.textFieldScore.leftView = self.imageViewScore;
    self.textFieldScore.leftViewMode = UITextFieldViewModeAlways;
    
    self.btnFinish = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnFinish.frame = CGRectMake(66.5, 640, 100, 40);
    [self.btnFinish.layer setCornerRadius:8.0];
    [self.btnFinish.layer setMasksToBounds:YES];
    [self.btnFinish.layer setBorderWidth:1.0];
    [self.btnFinish.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnFinish setTitle:@"完成" forState:UIControlStateNormal];
    [self.btnFinish setTintColor:[UIColor whiteColor]];
    self.btnFinish.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btnFinish addTarget:self action:@selector(pressBtnFinish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnFinish];
    
    self.btnReturn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnReturn.frame = CGRectMake(210.5, 640, 100, 40);
    [self.btnReturn.layer setCornerRadius:8.0];
    [self.btnReturn.layer setMasksToBounds:YES];
    [self.btnReturn.layer setBorderWidth:1.0];
    [self.btnReturn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btnReturn setTitle:@"返回" forState:UIControlStateNormal];
    [self.btnReturn setTintColor:[UIColor whiteColor]];
    self.btnReturn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btnReturn addTarget:self action:@selector(pressBtnReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btnReturn];
    
}
- (void)pressBtnReturn {
    NSLog(@"8888");
    [self.delegate3 returnName:self.textFieldName.text andClass:self.textFieldClass.text andScore:self.textFieldScore.text];
    NSLog(@"111111111");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressBtnFinish {
    if ([self.textFieldName.text isEqualToString:@""]) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"输入项不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        return;
    }
    self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [self.alert addAction:action];
    [self presentViewController:self.alert animated:YES completion:nil];
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
