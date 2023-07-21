//
//  myFindView.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/17.
//

#import "MyFindViewController.h"
#import "SheZhiViewController.h"
#import "MyTableViewCell2.h"
@interface MyFindViewController ()

@end

@implementation MyFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  =  [UIColor systemGray6Color];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_mulu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"maikefeng.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationItem.leftBarButtonItem = btnNext;
    self.navigationItem.rightBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor blackColor]];
    
    self.textField  = [[UITextField alloc] init];
    self.textField.frame = CGRectMake(100, 5, 250, 10);
    self.textField.font = [UIFont systemFontOfSize:10];
    self.textField.textColor = [UIColor blackColor];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor systemGray6Color];
    self.textField.placeholder = @"请输入...";
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.delegate = self;
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sousuo.png"]];
    self.imageView.frame = CGRectMake(0, 0, 20, 20);
    self.textField.inputView = self.imageView;
    
    /**
        *  自定义输入视图
        
        1:创建一个和手机屏幕等宽 高度自定义的view
        2:设置这个view的属性,把一些自定义的东西添加上去
        3:将这个view指定为输入框的输入视图
        */
       UIView *viewBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
       viewBack.backgroundColor = [UIColor blackColor];
    self.textField.inputView = viewBack;
    self.navigationItem.titleView = self.textField;
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"444"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"555"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"666"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"777"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"888"];
    [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"999"];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 4) {
        return 5;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111");
    if (indexPath.section == 0 || indexPath.section == 2) {
        return 150;
    }
    if (indexPath.section == 1) {
        return 80;
    }
    return 260;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 320, 15)];
        label1.text = @"        推荐歌单 >";
        label1.font = [UIFont systemFontOfSize:15];
        label1.textColor = [UIColor grayColor];
        label1.backgroundColor = [UIColor whiteColor];
        return label1;
    }
    if (section == 3) {
        UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 320, 15)];
        label1.text = @"        推荐歌曲 >";
        label1.font = [UIFont systemFontOfSize:15];
        label1.textColor = [UIColor grayColor];
        label1.backgroundColor = [UIColor whiteColor];
        return label1;
    }
    return nil;
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"120");
    if (section == 3 || section == 2) {
        return 40;
    }
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 1){
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 2){
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else if (indexPath.section == 3){
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    } else {
        MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
        cell.backgroundColor  = [UIColor whiteColor];
        return cell;
    }
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息享用者
    [self.textField resignFirstResponder];
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
