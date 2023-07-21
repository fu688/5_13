//
//  mysView.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/17.
//

#import "MysViewController.h"
#import "SheZhiViewController.h"
#import "MyTableViewCell.h"
@interface MysViewController ()

@end

@implementation MysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  =  [UIColor systemGray6Color];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_mulu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self. navigationItem.title = @"我的";
    self.navigationItem.leftBarButtonItem = btnNext;
    self.navigationItem.rightBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor blackColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"444"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"555"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"666"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"777"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"888"];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"999"];
    
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1689662423431.jpeg"]];
    self.imageView.layer.masksToBounds = YES;
    self.imageView.frame = CGRectMake(156.5, 10, 80, 80);
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
    self.imageView.layer.borderWidth = 2.0;
    self.imageView.layer.borderColor = [UIColor redColor].CGColor;
    [self.tableView addSubview:self.imageView];
    
}
- (void)pressLeft {
    CATransition* amin = [CATransition animation];
    amin.duration = 0.75;
    amin.type = kCATransitionMoveIn;
    amin.subtype = kCATransitionFromLeft;
    
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
    SheZhiViewController* sheZhiView = [[SheZhiViewController alloc] init];
    [self.navigationController pushViewController:sheZhiView animated:NO];
}
- (void)pressRight {
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 2;
    }
    if (section == 3 || section == 4) {
        return 5;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    if (indexPath.section == 0) {
        return 120;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 155;
        } else{
            return 50;
        }
    }
    if (indexPath.section == 3 || indexPath.section == 4) {
        return 80;
    }
    return 80;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 320, 15)];
        label1.text = @"        创建歌单（4个）";
        label1.font = [UIFont systemFontOfSize:15];
        label1.textColor = [UIColor grayColor];
        label1.backgroundColor = [UIColor whiteColor];
        return label1;
    }
    return nil;
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"120");
    if (section == 3 || section == 4) {
        return 40;
    }
    if (section == 0) {
        return 40;
    }
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
            
        } else {
            MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
        }
    } else if(indexPath.section == 2) {
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 0) {
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 1){
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"555" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 2){
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"666" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 3){
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"777" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else {
        MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"888" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
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
