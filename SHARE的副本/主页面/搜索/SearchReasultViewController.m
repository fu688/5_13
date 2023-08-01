//
//  SearchReasultViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/25.
//

#import "SearchReasultViewController.h"
#import "MyTableViewCell4.h"
#import "ShangchuanViewController.h"
@interface SearchReasultViewController ()

@end

@implementation SearchReasultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"搜索";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor systemGray6Color];
    
    UINavigationBarAppearance* apperance = [UINavigationBarAppearance new];
    [apperance configureWithOpaqueBackground];
    apperance.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    apperance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = apperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shangchuan"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = btnNext;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(10, 110, 373, 50);
    self.textFiled.text = self.text;
    self.textFiled.textColor = [UIColor blackColor];
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
    self.btn1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn1 setImage:[UIImage imageNamed:@"search_button"] forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(pressSea) forControlEvents:UIControlEventTouchUpInside];
    self.textFiled.leftView  = self.btn1;
    self.textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, 393, 1000) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell4 class] forCellReuseIdentifier:@"0"];
    [self.tableView registerClass:[MyTableViewCell4 class] forCellReuseIdentifier:@"1"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 120;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
            MyTableViewCell4* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
        } else {
            MyTableViewCell4* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" ];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
        }
}
- (void)pressSea {
    
}
- (void) pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) pressRight {
    ShangchuanViewController* shangchuanView = [[ShangchuanViewController alloc] init];
    [self.navigationController pushViewController:shangchuanView animated:YES];
    
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
