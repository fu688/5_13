//
//  PushViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "PushViewController.h"
#import "MyTableViewCell2.h"
@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.navigationItem.title = @"我的推荐";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"0"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"1"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"2"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"3"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    return 120;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"120");
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1){
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 2) {
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else {
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    }
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
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
