//
//  AttentionViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "AttentionViewController.h"
#import "AttentionTableViewCell.h"
@interface AttentionViewController ()

@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[AttentionTableViewCell class] forCellReuseIdentifier:@"000"];
    self.array1 = [NSMutableArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小白", nil];
    self.array2 = [NSMutableArray arrayWithObjects:@"sixin_img1", @"sixin_img2", @"sixin_img3", @"sixin_img4", nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
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
    AttentionTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
    cell.backgroundColor  = [UIColor whiteColor];
    cell.label.text = self.array1[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sixin_img%ld", indexPath.row + 1]];
    return cell;
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
