//
//  AddViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import "AddViewController.h"
#import "XinXiTableViewCell.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textFieldName = [[UITextField alloc] init];
    self.textFieldName.frame = CGRectMake(46.5, 430, 300, 50);
    self.textFieldName.borderStyle = UITextBorderStyleRoundedRect;
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
    
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 393, 40 * self.arrayNameAdd.count) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[XinXiTableViewCell class] forCellReuseIdentifier:@"111"];
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayNameAdd.count;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
    
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
    
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
    
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XinXiTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[XinXiTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.labelName.text = self.arrayNameAdd[indexPath.row];
    cell.labelName.font = [UIFont systemFontOfSize:20];
    cell.labelClass.text = self.arrayClassAdd[indexPath.row];
    cell.labelClass.font = [UIFont systemFontOfSize:20];
    cell.labelScore.text = self.arrayscoreAdd[indexPath.row];
    cell.labelScore.font = [UIFont systemFontOfSize:20];
    return cell;
}
- (void)pressBtnFinish {
    if ([self.textFieldName.text isEqualToString:@""] || [self.textFieldClass.text isEqualToString:@""] || [self.textFieldScore.text isEqualToString:@""]) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"输入项不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        return;
    }
    if ([self.textFieldScore.text intValue] > 100 ||[self.textFieldScore.text intValue] < 0) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"输入分数不符合" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        return;
    }
    int j = 0;
    for (int i = 0; i < self.arrayNameAdd.count; i++) {
        if ([self.textFieldName.text isEqualToString:self.arrayNameAdd[i]]) {
            if ([self.textFieldClass.text isEqualToString:self.arrayClassAdd[i]] == YES) {
                j = 1;
                /*NSLog(@"12343");
                [self.arrayNameAdd addObject:self.textFieldName.text];
                [self.arrayClassAdd addObject:self.textFieldClass.text];
                [self.arrayscoreAdd addObject:self.textFieldScore.text];
                [self.delegate passname:self.textFieldName.text andclass:self.textFieldClass.text andscore:self.textFieldScore.text];
                self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayNameAdd.count);
                [self.tableView reloadData];*/
            }
            /*if (j == 0){
                self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"该信息已存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
                [self.alert addAction:action];
                [self presentViewController:self.alert animated:YES completion:nil];
                return;
            }*/
        }
    }
    if (j == 1) {
        self.alert = [UIAlertController alertControllerWithTitle:@"" message:@"该信息已存在" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        
    }
    if (j == 0) {
        NSLog(@"111223239");
        [self.arrayNameAdd addObject:self.textFieldName.text];
        [self.arrayClassAdd addObject:self.textFieldClass.text];
        [self.arrayscoreAdd addObject:self.textFieldScore.text];
        [self.delegate passArrayNameAdd:self.arrayNameAdd andArrayClassAdd:self.arrayClassAdd andArrayScoreAdd:self.arrayscoreAdd];
        self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayNameAdd.count);
        [self.tableView reloadData];
    }
}
- (void)pressBtnReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
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
