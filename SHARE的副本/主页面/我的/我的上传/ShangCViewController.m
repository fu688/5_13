//
//  ShangCViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/27.
//

#import "ShangCViewController.h"
#import "MyTableViewCell2.h"
@interface ShangCViewController ()

@end

@implementation ShangCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  =  [UIColor systemGray6Color];
    self.navigationItem.title = @"我的上传";
    
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];

    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.segControl = [[UISegmentedControl alloc] init];
    self.segControl.frame = CGRectMake(0, 100, 393, 40);
    [self.segControl insertSegmentWithTitle:@"精选文章" atIndex:0 animated:NO];
    [self.segControl insertSegmentWithTitle:@"热门推荐" atIndex:1 animated:NO];
    [self.segControl insertSegmentWithTitle:@"全部文章" atIndex:2 animated:NO];
    [self.segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    self.segControl.selectedSegmentIndex  = 0;
    [self.view addSubview:self.segControl];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 140, 393, 1000);
    self.scrollView.pagingEnabled  = YES;
    self.scrollView.scrollEnabled  = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(393 * 3, 1000);
    [self.view addSubview:self.scrollView];
    for (int i = 0 ; i < 3; i++) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(393 * i, 0, 393, 1000) style:UITableViewStyleGrouped];
            self.tableView.delegate = self;
            self.tableView.dataSource = self;
            [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"0"];
            [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"1"];
            [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"2"];
            [self.tableView registerClass:[MyTableViewCell2 class] forCellReuseIdentifier:@"3"];
        [self.scrollView addSubview:self.tableView];
    }
    [self.view addSubview:self.scrollView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 120;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
            MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0"];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
        } else if (indexPath.section == 1 ) {
            MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" ];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
            
        } else if (indexPath.section == 2 ) {
            MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" ];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
            
        } else  {
            MyTableViewCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:@"3" ];
            cell.backgroundColor  = [UIColor whiteColor];
            return cell;
        }
}
- (void)segChange {
    if (self.segControl.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (self.segControl.selectedSegmentIndex == 1) {
        [self.scrollView setContentOffset:CGPointMake(393, 0) animated:YES];
    }
    if (self.segControl.selectedSegmentIndex == 2) {
        [self.scrollView setContentOffset:CGPointMake(393 * 2, 0) animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x >= 0 && self.scrollView.contentOffset.x <= 196.5) {
        self.segControl.selectedSegmentIndex = 0;
    }
    if (self.scrollView.contentOffset.x > 196.5 && self.scrollView.contentOffset.x <= 589.5) {
        self.segControl.selectedSegmentIndex = 1;
    }
    if (self.scrollView.contentOffset.x > 589.5 && self.scrollView.contentOffset.x <= 982.5) {
        self.segControl.selectedSegmentIndex = 2;
    }}
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
