//
//  HomeViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import "HomeViewController.h"
#import "XinXiTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "FindViewController.h"
#import "SortViewController.h"
#import "LoginViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arrayName = [NSMutableArray arrayWithObjects:@"张三", @"李四", @"李华", @"小明", nil];
    self.arrayClass = [NSMutableArray arrayWithObjects:@"a班", @"c班", @"b班", @"d班", nil];
    self.arrayscore = [NSMutableArray arrayWithObjects:@"98", @"60", @"90", @"80", nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 393, 40 * self.arrayName.count) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[XinXiTableViewCell class] forCellReuseIdentifier:@"111"];
    
    self.buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonAdd.frame = CGRectMake(66.5, 450, 100, 40);
    [self.buttonAdd.layer setCornerRadius:8.0];
    [self.buttonAdd.layer setMasksToBounds:YES];
    [self.buttonAdd.layer setBorderWidth:1.0];
    [self.buttonAdd.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonAdd setTitle:@"Add" forState:UIControlStateNormal];
    [self.buttonAdd setTintColor:[UIColor whiteColor]];
    self.buttonAdd.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonAdd addTarget:self action:@selector(pressBtnAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonAdd];
    
    self.buttonDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonDelete.frame = CGRectMake(210.5, 450, 100, 40);
    [self.buttonDelete.layer setCornerRadius:8.0];
    [self.buttonDelete.layer setMasksToBounds:YES];
    [self.buttonDelete.layer setBorderWidth:1.0];
    [self.buttonDelete.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [self.buttonDelete setTintColor:[UIColor whiteColor]];
    self.buttonDelete.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonDelete addTarget:self action:@selector(pressBtnDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonDelete];
    
    self.buttonChange = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonChange.frame = CGRectMake(66.5, 520, 100, 40);
    [self.buttonChange.layer setCornerRadius:8.0];
    [self.buttonChange.layer setMasksToBounds:YES];
    [self.buttonChange.layer setBorderWidth:1.0];
    [self.buttonChange.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonChange setTitle:@"Change" forState:UIControlStateNormal];
    [self.buttonChange setTintColor:[UIColor whiteColor]];
    self.buttonChange.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonChange addTarget:self action:@selector(pressBtnChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonChange];
    
    self.buttonFind = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonFind.frame = CGRectMake(210.5, 520, 100, 40);
    [self.buttonFind.layer setCornerRadius:8.0];
    [self.buttonFind.layer setMasksToBounds:YES];
    [self.buttonFind.layer setBorderWidth:1.0];
    [self.buttonFind.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonFind setTitle:@"Find" forState:UIControlStateNormal];
    [self.buttonFind setTintColor:[UIColor whiteColor]];
    self.buttonFind.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonFind addTarget:self action:@selector(pressBtnFind) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonFind];
    
    self.buttonSort = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonSort.frame = CGRectMake(66.5, 590, 100, 40);
    [self.buttonSort.layer setCornerRadius:8.0];
    [self.buttonSort.layer setMasksToBounds:YES];
    [self.buttonSort.layer setBorderWidth:1.0];
    [self.buttonSort.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonSort setTitle:@"Sort" forState:UIControlStateNormal];
    [self.buttonSort setTintColor:[UIColor whiteColor]];
    self.buttonSort.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonSort addTarget:self action:@selector(pressBtnSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonSort];
    
    self.buttonExit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonExit.frame = CGRectMake(210.5, 590, 100, 40);
    [self.buttonExit.layer setCornerRadius:8.0];
    [self.buttonExit.layer setMasksToBounds:YES];
    [self.buttonExit.layer setBorderWidth:1.0];
    [self.buttonExit.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonExit setTitle:@"Exit" forState:UIControlStateNormal];
    [self.buttonExit setTintColor:[UIColor whiteColor]];
    self.buttonExit.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.buttonExit addTarget:self action:@selector(pressBtnExit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonExit];
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayName.count;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
    
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
    
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
    
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XinXiTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[XinXiTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.labelName.text = self.arrayName[indexPath.row];
    cell.labelName.font = [UIFont systemFontOfSize:20];
    cell.labelClass.text = self.arrayClass[indexPath.row];
    cell.labelClass.font = [UIFont systemFontOfSize:20];
    cell.labelScore.text = self.arrayscore[indexPath.row];
    cell.labelScore.font = [UIFont systemFontOfSize:20];
    return cell;
}
- (void) pressBtnAdd {
    AddViewController* addView = [[AddViewController alloc] init];
    addView.arrayNameAdd = [NSMutableArray array];
    addView.arrayClassAdd = [NSMutableArray array];
    addView.arrayscoreAdd = [NSMutableArray array];
    [addView.arrayNameAdd addObjectsFromArray:self.arrayName];
    [addView.arrayClassAdd addObjectsFromArray:self.arrayClass];
    [addView.arrayscoreAdd addObjectsFromArray:self.arrayscore];
    addView.delegate = self;
    addView.modalPresentationStyle = NO;
    [self presentViewController:addView animated:YES completion:nil];
}
- (void)passArrayNameAdd:(NSMutableArray *)array1 andArrayClassAdd:(NSMutableArray *)array2 andArrayScoreAdd:(NSMutableArray *)array3 {
    self.arrayName = [NSMutableArray array];
    self.arrayClass = [NSMutableArray array];
    self.arrayscore = [NSMutableArray array];
    [self.arrayName addObjectsFromArray:array1];
    [self.arrayscore addObjectsFromArray:array3];
    [self.arrayClass addObjectsFromArray:array2];
    self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayName.count);
    [self.tableView reloadData];
}
- (void)pressBtnDelete {
    DeleteViewController* deleteView = [[DeleteViewController alloc] init];
    deleteView.arrayNameDelete = [NSMutableArray array];
    deleteView.arrayClassDelete = [NSMutableArray array];
    deleteView.arrayscoreDelete = [NSMutableArray array];
    [deleteView.arrayNameDelete addObjectsFromArray:self.arrayName];
    [deleteView.arrayClassDelete addObjectsFromArray:self.arrayClass];
    [deleteView.arrayscoreDelete addObjectsFromArray:self.arrayscore];
    deleteView.delegate = self;
    deleteView.modalPresentationStyle = NO;
    [self presentViewController:deleteView animated:YES completion:nil];
}
- (void)passArrayNameDelete:(NSMutableArray *)array1 andAarrayClassDelete:(NSMutableArray *)array2 andArrayScoreDelete:(NSMutableArray *)array3 {
    self.arrayName = [NSMutableArray array];
    self.arrayClass = [NSMutableArray array];
    self.arrayscore = [NSMutableArray array];
    [self.arrayName addObjectsFromArray:array1];
    [self.arrayscore addObjectsFromArray:array3];
    [self.arrayClass addObjectsFromArray:array2];
    self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayName.count);
    [self.tableView reloadData];
}
- (void)pressBtnChange {
    ChangeViewController* changeView = [[ChangeViewController alloc] init];
    changeView.arrayNameChange = [NSMutableArray array];
    changeView.arrayClassChange = [NSMutableArray array];
    changeView.arrayscoreChange = [NSMutableArray array];
    [changeView.arrayNameChange addObjectsFromArray:self.arrayName];
    [changeView.arrayClassChange addObjectsFromArray:self.arrayClass];
    [changeView.arrayscoreChange addObjectsFromArray:self.arrayscore];
    
    changeView.delegate = self;
    changeView.modalPresentationStyle = NO;
    [self presentViewController:changeView animated:YES completion:nil];
    
}
- (void)passarraynameChange:(NSMutableArray *)array1 andarrayChange:(NSMutableArray *)array2 andarrayChange:(NSMutableArray *)array3 {
    self.arrayName = [NSMutableArray array];
    self.arrayClass = [NSMutableArray array];
    self.arrayscore = [NSMutableArray array];
    [self.arrayName addObjectsFromArray:array1];
    [self.arrayscore addObjectsFromArray:array3];
    [self.arrayClass addObjectsFromArray:array2];
    self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayName.count);
    [self.tableView reloadData];
    
}
- (void)pressBtnFind {
    FindViewController* findView = [[FindViewController alloc] init];
    findView.arrayNameFind = [NSMutableArray array];
    findView.arrayClassFind = [NSMutableArray array];
    findView.arrayscoreFind = [NSMutableArray array];
    
    [findView.arrayNameFind addObjectsFromArray:self.arrayName];
    [findView.arrayClassFind addObjectsFromArray:self.arrayClass];
    [findView.arrayscoreFind addObjectsFromArray:self.arrayscore];

    findView.modalPresentationStyle = NO;
    [self presentViewController:findView animated:YES completion:nil];
    
}
- (void)pressBtnSort {
    SortViewController* sortView = [[SortViewController alloc] init];
    sortView.arrayNameSort = [NSMutableArray array];
    sortView.arrayClassSort = [NSMutableArray array];
    sortView.arrayScoreSort = [NSMutableArray array];
    
    [sortView.arrayNameSort addObjectsFromArray:self.arrayName];
    [sortView.arrayClassSort addObjectsFromArray:self.arrayClass];
    [sortView.arrayScoreSort addObjectsFromArray:self.arrayscore];
    
    sortView.delegate = self;
    sortView.modalPresentationStyle = NO;
    [self presentViewController:sortView animated:YES completion:nil];
}
- (void)pressBtnExit {
    NSLog(@"111");
    LoginViewController* LoginView = [[LoginViewController alloc] init];
    UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    NSArray<UIWindow *> *windows = windowScene.windows;
    UIWindow *window = windows.firstObject;
    window.rootViewController = LoginView;
    
}
- (void)passArrayName:(NSMutableArray *)array1 andArrayClass:(NSMutableArray *)array2 andArrayScore:(NSMutableArray *)array3 {
    NSLog(@"999");
    NSLog(@"%@", array1[1]);
    self.arrayName = [NSMutableArray array];
    self.arrayClass = [NSMutableArray array];
    self.arrayscore = [NSMutableArray array];
    [self.arrayName addObjectsFromArray:array1];
    [self.arrayscore addObjectsFromArray:array3];
    [self.arrayClass addObjectsFromArray:array2];
    self.tableView.frame = CGRectMake(0, 80, 393, 40 * self.arrayName.count);
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
