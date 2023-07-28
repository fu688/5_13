//
//  MysViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "MysViewController.h"
#import "MyTableViewCell7.h"
#import "ShangCViewController.h"
#import "MyPassViewController.h"
#import "PushViewController.h"
#import "LoginViewController.h"
#import "SheZhiViewController.h"
@interface MysViewController ()

@end

@implementation MysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"文章";
    
    
    UINavigationBarAppearance* apperance = [UINavigationBarAppearance new];
    [apperance configureWithOpaqueBackground];
    apperance.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    apperance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = apperance;
    self.navigationController.navigationBar.scrollEdgeAppearance =
    self.navigationController.navigationBar.standardAppearance;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 393, 800) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell7 class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell7 class] forCellReuseIdentifier:@"111"];
    self.array1  = [NSMutableArray arrayWithObjects:@"我的上传", @"我的信息", @"我的推荐", @"院系通知", @"设置", @"退出", nil];
    self.array2 = [NSMutableArray arrayWithObjects:@"mys-1",@"mys_2", @"mys_3", @"mys_4", @" mys_4" , @"mys_5", @"mys_6",nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 6;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 80;
    }
    return 150;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1)  {
        MyTableViewCell7* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        
        cell.label.text = self.array1[indexPath.row];
        cell.imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"mys_%ld", indexPath.row + 1]];
        cell.imageView2.image = [UIImage imageNamed:@"arrow-right"];
        return cell;
    } else {
        MyTableViewCell7* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.label.text = @"SHARE小白";
        cell.label1.text = @"数枚 / 设计爱好者";
        cell.label2.text = @"开心了就笑，不开心也要笑";
        cell.imageView1.image = [UIImage imageNamed:@"works_head"];
        return  cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 0) {
        ShangCViewController* shangchuanView = [[ShangCViewController alloc] init];
        [self.navigationController pushViewController:shangchuanView animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        MyPassViewController* myPassView = [[MyPassViewController alloc] init];
        [self.navigationController pushViewController:myPassView animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        PushViewController* pushView = [[PushViewController alloc] init];
        [self.navigationController pushViewController:pushView animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"暂无新的内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
        
    } else if (indexPath.section == 1 && indexPath.row == 5) {
        LoginViewController* loginView = [[LoginViewController alloc] init];
        UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
        NSArray<UIWindow *> *windows = windowScene.windows;
        UIWindow *window = windows.firstObject;
        window.rootViewController = loginView;
    } else {
        SheZhiViewController* shezhiView = [[SheZhiViewController alloc] init];
        [self.navigationController pushViewController:shezhiView animated:YES];
    }
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
