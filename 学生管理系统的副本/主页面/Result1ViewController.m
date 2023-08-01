//
//  Result1ViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import "Result1ViewController.h"
#import "XinXiTableViewCell.h"
@interface Result1ViewController ()

@end

@implementation Result1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel* label = [[UILabel alloc] init];
    label.text = @"你查找的学生信息为";
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(100, 100, 300, 50);
    label.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 393, 40 * self.arrayName.count) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[XinXiTableViewCell class] forCellReuseIdentifier:@"111"];
    
    self.btnReturn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnReturn.frame = CGRectMake(146.5, 640, 100, 40);
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
    return self.arrayName.count;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
    cell.labelName.text = self.arrayName[indexPath.row];
    cell.labelName.font = [UIFont systemFontOfSize:20];
    cell.labelClass.text = self.arrayClass[indexPath.row];
    cell.labelClass.font = [UIFont systemFontOfSize:20];
    cell.labelScore.text = self.arrayScore[indexPath.row];
    cell.labelScore.font = [UIFont systemFontOfSize:20];
    return cell;
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
