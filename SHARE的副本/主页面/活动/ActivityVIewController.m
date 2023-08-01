//
//  ActivityVIewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "ActivityVIewController.h"
#import "MyTableViewCell6.h"
@interface ActivityVIewController ()

@end

@implementation ActivityVIewController

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
    [self.tableView registerClass:[MyTableViewCell6 class] forCellReuseIdentifier:@"111"];
    
    self.array1 = [NSMutableArray arrayWithObjects:@"ac_1", @"ac_2", @"ac_3", nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 200;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell6* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    NSString* str = [NSString stringWithFormat:@"ac_%ld", indexPath.section + 1];
    cell.imageView1.image = [UIImage imageNamed:str];
    return cell;
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
