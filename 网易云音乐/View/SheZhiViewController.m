//
//  sheZhiViewController.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/19.
//

#import "SheZhiViewController.h"
#import "MyTableViewCell1.h"
@interface SheZhiViewController ()

@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"设置";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor systemGray6Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    // 删除导航栏左侧按钮
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]init];
    barBtn.title=@"";
    self.navigationItem.leftBarButtonItem = barBtn;
    self.btn2 = [[UIBarButtonItem alloc] initWithTitle:@"我的"
    style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    [self.btn2 setTintColor:[UIColor blackColor]];
    self.btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui-2.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    [self.btnNext1 setTintColor:[UIColor blackColor]];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:self.btn2, self.btnNext1,  nil]];
    
    
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"444"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"555"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"666"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"777"];
    [self.tableView registerClass:[MyTableViewCell1 class] forCellReuseIdentifier:@"888"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1){
        return 5;
    } else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 1) {
        return 50;
    } else {
        return 70;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 40;
    } else {
        return 0;
    }
    
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 320, 15)];
        self.label.text = @"      音乐服务";
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.textColor = [UIColor grayColor];
        self.label.backgroundColor = [UIColor whiteColor];
        return self.label;
    }
    if (section == 1) {
        self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 320, 15)];
        self.label1.text = @"      其他";
        self.label1.font = [UIFont systemFontOfSize:15];
        self.label1.textColor = [UIColor grayColor];
        self.label1.backgroundColor = [UIColor whiteColor];
        return self.label1;
    }
    return nil;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        self.cell.backgroundColor  = [UIColor whiteColor];
        return self.cell;
    } else if (indexPath.section == 0 && indexPath.row == 1){
        self.cell1 = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        self.cell1.backgroundColor  = [UIColor whiteColor];
        return self.cell1;
    } else if (indexPath.section == 0 && indexPath.row == 2){
        self.cell2 = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        self.cell2.backgroundColor  = [UIColor whiteColor];
        return self.cell2;
    } else if (indexPath.section == 1 && indexPath.row == 0){
        self.cell3 = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        self.cell3.backgroundColor  = [UIColor whiteColor];
        return self.cell3;
    } else if (indexPath.section == 1 && indexPath.row == 1){
        self.cell4 = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
        self.cell4.backgroundColor  = [UIColor whiteColor];
        return self.cell4;
    } else if (indexPath.section == 1 && indexPath.row == 2){
        self.cell5 = [self.tableView dequeueReusableCellWithIdentifier:@"555" forIndexPath:indexPath];
        self.cell5.backgroundColor  = [UIColor whiteColor];
        return self.cell5;
    } else if (indexPath.section == 1 && indexPath.row == 3){
        self.cell6 = [self.tableView dequeueReusableCellWithIdentifier:@"666" forIndexPath:indexPath];
        self.cell6.backgroundColor  = [UIColor whiteColor];
        return self.cell6;
    } else if (indexPath.section == 1 && indexPath.row == 4){
        self.cell7 = [self.tableView dequeueReusableCellWithIdentifier:@"777" forIndexPath:indexPath];
        self.cell7.backgroundColor  = [UIColor whiteColor];
        return self.cell7;
    } else {
        self.cell8 = [self.tableView dequeueReusableCellWithIdentifier:@"888" forIndexPath:indexPath];
        self.cell8.backgroundColor  = [UIColor whiteColor];
        return self.cell8;
    }
}
- (void)pressRight {
    CATransition* amin = [CATransition animation];
    amin.duration = 0.75;
    amin.type = kCATransitionMoveIn;
    amin.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)swChange:(UISwitch*)sw {
    if (sw.on == YES) {
        self.tableView.backgroundColor = [UIColor blackColor];
        self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
        [self.btn2 setTintColor:[UIColor whiteColor]];
        [self.btnNext1 setTintColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        self.label.backgroundColor = [UIColor blackColor];
        self.label1.backgroundColor = [UIColor blackColor];
        self.cell.backgroundColor = [UIColor blackColor];
        self.cell1.backgroundColor = [UIColor blackColor];
        self.cell2.backgroundColor = [UIColor blackColor];
        self.cell3.backgroundColor = [UIColor blackColor];
        self.cell4.backgroundColor = [UIColor blackColor];
        self.cell5.backgroundColor = [UIColor blackColor];
        self.cell6.backgroundColor = [UIColor blackColor];
        self.cell7.backgroundColor = [UIColor blackColor];
        self.cell8.backgroundColor = [UIColor blackColor];
        
    }
    if (sw.on == NO) {
        self.tableView.backgroundColor = [UIColor systemGray6Color];
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
        [self.btn2 setTintColor:[UIColor blackColor]];
        [self.btnNext1 setTintColor:[UIColor blackColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
        self.label.backgroundColor = [UIColor whiteColor];
        self.label1.backgroundColor = [UIColor whiteColor];
        self.cell.backgroundColor = [UIColor whiteColor];
        self.cell1.backgroundColor = [UIColor whiteColor];
        self.cell2.backgroundColor = [UIColor whiteColor];
        self.cell3.backgroundColor = [UIColor whiteColor];
        self.cell4.backgroundColor = [UIColor whiteColor];
        self.cell5.backgroundColor = [UIColor whiteColor];
        self.cell6.backgroundColor = [UIColor whiteColor];
        self.cell7.backgroundColor = [UIColor whiteColor];
        self.cell8.backgroundColor = [UIColor whiteColor];
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
