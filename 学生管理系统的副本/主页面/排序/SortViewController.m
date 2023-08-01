//
//  SortViewController.m
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import "SortViewController.h"
#import "XinXiTableViewCell.h"
@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 393, 40 * self.arrayNameSort.count) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[XinXiTableViewCell class] forCellReuseIdentifier:@"111"];

    self.buttonNameSort = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonNameSort.frame = CGRectMake(66.5, 420, 100, 40);
    [self.buttonNameSort.layer setCornerRadius:8.0];
    [self.buttonNameSort.layer setMasksToBounds:YES];
    [self.buttonNameSort.layer setBorderWidth:1.0];
    [self.buttonNameSort.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonNameSort setTitle:@"名字排序" forState:UIControlStateNormal];
    [self.buttonNameSort setTintColor:[UIColor whiteColor]];
    self.buttonNameSort.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.buttonNameSort addTarget:self action:@selector(pressBtnNameSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonNameSort];
    
    self.buttonClassSort = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonClassSort.frame = CGRectMake(210.5, 420, 100, 40);
    [self.buttonClassSort.layer setCornerRadius:8.0];
    [self.buttonClassSort.layer setMasksToBounds:YES];
    [self.buttonClassSort.layer setBorderWidth:1.0];
    [self.buttonClassSort.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonClassSort setTitle:@"班级排序" forState:UIControlStateNormal];
    [self.buttonClassSort setTintColor:[UIColor whiteColor]];
    self.buttonClassSort.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.buttonClassSort addTarget:self action:@selector(pressBtnClassSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonClassSort];
    
    self.buttonScoreSort = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonScoreSort.frame = CGRectMake(66.5, 490, 100, 40);
    [self.buttonScoreSort.layer setCornerRadius:8.0];
    [self.buttonScoreSort.layer setMasksToBounds:YES];
    [self.buttonScoreSort.layer setBorderWidth:1.0];
    [self.buttonScoreSort.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonScoreSort setTitle:@"分数排序" forState:UIControlStateNormal];
    [self.buttonScoreSort setTintColor:[UIColor whiteColor]];
    self.buttonScoreSort.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.buttonScoreSort addTarget:self action:@selector(pressBtnScoreSort) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonScoreSort];
    
    self.buttonReturn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonReturn.frame = CGRectMake(210.5, 490, 100, 40);
    [self.buttonReturn.layer setCornerRadius:8.0];
    [self.buttonReturn.layer setMasksToBounds:YES];
    [self.buttonReturn.layer setBorderWidth:1.0];
    [self.buttonReturn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.buttonReturn setTitle:@"返回" forState:UIControlStateNormal];
    [self.buttonReturn setTintColor:[UIColor whiteColor]];
    self.buttonReturn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.buttonReturn addTarget:self action:@selector(pressBtnReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonReturn];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayNameSort.count;
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
    cell.labelName.text = self.arrayNameSort[indexPath.row];
    cell.labelName.font = [UIFont systemFontOfSize:20];
    cell.labelClass.text = self.arrayClassSort[indexPath.row];
    cell.labelClass.font = [UIFont systemFontOfSize:20];
    cell.labelScore.text = self.arrayScoreSort[indexPath.row];
    cell.labelScore.font = [UIFont systemFontOfSize:20];
    return cell;
}
- (void)pressBtnNameSort {
    for (int i = 0; i < self.arrayNameSort.count; i++) {
        for (int j = 0; j < self.arrayNameSort.count - i - 1; j++) {
            const char* str1 = [self.arrayNameSort[j] UTF8String];
            const char* str2 = [self.arrayNameSort[j + 1] UTF8String];
            if (strcmp(str1, str2) >= 0) {
                [self.arrayScoreSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayNameSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayClassSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    [self.tableView reloadData];
    [self.delegate passArrayName:self.arrayNameSort andArrayClass:self.arrayClassSort andArrayScore:self.arrayScoreSort];
}
- (void)pressBtnClassSort {
    for (int i = 0; i < self.arrayClassSort.count; i++) {
        for (int j = 0; j < self.arrayClassSort.count - i - 1; j++) {
            const char* str1 = [self.arrayClassSort[j] UTF8String];
            const char* str2 = [self.arrayClassSort[j + 1] UTF8String];
            if (strcmp(str1, str2) >= 0) {
                [self.arrayScoreSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayNameSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayClassSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    [self.tableView reloadData];
    [self.delegate passArrayName:self.arrayNameSort andArrayClass:self.arrayClassSort andArrayScore:self.arrayScoreSort];
}
- (void)pressBtnScoreSort {
    for (int i = 0; i < self.arrayScoreSort.count; i++) {
        for (int j = 0; j < self.arrayScoreSort.count - i - 1; j++) {
            if ([self.arrayScoreSort[j] intValue] <= [self.arrayScoreSort[j + 1] intValue]) {
                [self.arrayScoreSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayNameSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
                [self.arrayClassSort exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    [self.tableView reloadData];
    [self.delegate passArrayName:self.arrayNameSort andArrayClass:self.arrayClassSort andArrayScore:self.arrayScoreSort];
}
- (void)pressBtnReturn {
    [self dismissViewControllerAnimated:YES completion:nil];
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
