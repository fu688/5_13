//
//  WenZhangViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/24.
//

#import "WenZhangViewController.h"
#import "MyTableViewCell3.h"
@interface WenZhangViewController ()

@end

@implementation WenZhangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[MyTableViewCell3 class] forCellReuseIdentifier:@"444"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    if (indexPath.section == 1) {
        return 1500;
    }
    return 70;
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
        MyTableViewCell3* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.label4.text = self.cell1.label4.text;
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else {
        MyTableViewCell3* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    }
}
- (void)pressLeft {
    [self.delegate passCell:[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]];
    //[self.delegate passCell:[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
