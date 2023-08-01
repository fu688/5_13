//
//  SheZhiViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "SheZhiViewController.h"
#import "PassageUITableViewCell.h"
#import "JiBenViewController.h"
#import "PasswordViewController.h"
#import "XiaoxiViewController.h"
@interface SheZhiViewController ()

@end

@implementation SheZhiViewController

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
    [self.tableView registerClass:[PassageUITableViewCell class] forCellReuseIdentifier:@"000"];
    self.array1 = [NSMutableArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于Share", @"清除缓存", nil];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
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
    PassageUITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
    cell.backgroundColor  = [UIColor whiteColor];
    cell.label.text = self.array1[indexPath.row];
    cell.imageView1.image = [UIImage imageNamed:@"arrow-right"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0) {
        JiBenViewController* jibenView = [[JiBenViewController alloc] init];
        [self.navigationController pushViewController:jibenView animated:YES];
    }
    if (indexPath.row == 3) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"暂无新的内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    if (indexPath.row == 2) {
        XiaoxiViewController* xiaoxiView = [[XiaoxiViewController alloc] init];
        [self.navigationController pushViewController:xiaoxiView animated:YES];
    }
    if (indexPath.row == 1) {
        PasswordViewController* passwordView = [[PasswordViewController alloc] init];
        NSLog(@"111");
       [self.navigationController pushViewController:passwordView animated:YES];
    }
    if (indexPath.row == 4) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"正在处理" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:self.alert animated:YES completion:nil];
        self.timerView = [[NSTimer alloc] init];
        self.timerView  = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:NO];
    }
}
    /*if (indexPath.row == 0 || indexPath.row == 1 || ) {
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"暂无新的内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    }
    if (indexPath.row == 2) {
        AttentionViewController* attentionViwe = [[AttentionViewController alloc] init];
        [self.navigationController pushViewController:attentionViwe animated:YES];
    }
    if (indexPath.row == 3) {
        SiXinViewController* sinxinView = [[SiXinViewController alloc] init];
        [self.navigationController pushViewController:sinxinView animated:YES];
    }*/
- (void)timer {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSee:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
