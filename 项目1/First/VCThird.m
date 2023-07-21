//
//  VCThird.m
//  项目1
//
//  Created by 付闯 on 2023/7/14.
//

#import "VCThird.h"
#import "myTableViewCell.h"
#import "VCFour.h"
@interface VCThird ()

@end

@implementation VCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"111";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor systemGray6Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"000"];
    [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"111"];
    [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"222"];
    [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"333"];
    [_tableView registerClass:[myTableViewCell class] forCellReuseIdentifier:@"444"];
     self.view.backgroundColor = [UIColor whiteColor];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    VCFour* vcFour = [[VCFour alloc] init];
    [self.navigationController pushViewController:vcFour animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 1;
    }
    if (section == 1) {
        return 3;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else {
        return 50;
        
    }
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 100;
    } else {
        return 0;
    }
}
/*- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
}*/
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        myTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        myTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }  else if (indexPath.section == 1 && indexPath.row == 1) {
        myTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }   else if (indexPath.section == 1 && indexPath.row == 2) {
        myTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }   else {
        myTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
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
