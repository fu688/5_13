//
//  HomepageViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "HomepageViewController.h"
#import "MyTableViewCell1.h"
#import "WenZhangViewController.h"
@interface HomepageViewController ()

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINavigationBarAppearance* apperance = [UINavigationBarAppearance new];
    [apperance configureWithOpaqueBackground];
    apperance.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    apperance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = apperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    self.navigationItem.title = @"SHARE";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"444"];
    self.i = 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    if (indexPath.section == 0) {
        return 200;
    }
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
    if (indexPath.section == 0) {
        MyTableViewCell1* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1){
        MyTableViewCell1*  cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        if (self.i == 1) {
            cell.label4.text = self.cell.label4.text;
            cell.btn = self.cell.btn;
        } else {
            cell.label4.text = @"102";
        }
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 2){
        MyTableViewCell1* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3) {
        MyTableViewCell1* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else {
        MyTableViewCell1* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        
        WenZhangViewController* wenZhangView = [[WenZhangViewController alloc] init];
        wenZhangView.delegate = self;
        wenZhangView.cell1  = [self.tableView  cellForRowAtIndexPath:indexPath];
        [self.navigationController pushViewController:wenZhangView animated:YES];
    }
}
- (void)passCell:(MyTableViewCell1*)cell {
    self.cell = cell;
    self.i = 1;
    [self.tableView reloadData];
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
