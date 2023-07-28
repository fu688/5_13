//
//  JiBenViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "JiBenViewController.h"
#import "JiBenTableViewCell.h"
@interface JiBenViewController ()

@end

@implementation JiBenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[JiBenTableViewCell class] forCellReuseIdentifier:@"000"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[JiBenTableViewCell class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[JiBenTableViewCell class] forCellReuseIdentifier:@"111"];
    self.array1 = [NSMutableArray arrayWithObjects:@"头像", @"昵称", @"签名", @"性别", @"邮箱 ", nil];
    self.array2 = [NSMutableArray arrayWithObjects:@"1", @"share小白", @"开心就笑",@"3", @"12345678901@qq.com", nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    if (indexPath.row == 0) {
        return 100;
    }
    return 80;
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
    
    if (indexPath.row == 0) {
        JiBenTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];        cell.backgroundColor  = [UIColor whiteColor];
        cell.label1.text = self.array1[indexPath.row];
        cell.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"sixin_img%ld", indexPath.row + 1]];
        return cell;
    } else if (indexPath.row == 3) {
        JiBenTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];        cell.backgroundColor  = [UIColor whiteColor];
        cell.label1.text = self.array1[indexPath.row];
        cell.label2.text = @"男";
        cell.label3.text = @"女";
        return cell;
    } else {
        JiBenTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];       cell.backgroundColor  = [UIColor whiteColor];
        cell.label1.text = self.array1[indexPath.row];
        cell.label2.text = self.array2[indexPath.row];
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
