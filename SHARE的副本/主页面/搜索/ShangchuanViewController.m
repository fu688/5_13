//
//  ShangchuanViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/25.
//

#import "ShangchuanViewController.h"
#import "PictureViewController.h"
#import "MyTableViewCell5.h"
@interface ShangchuanViewController ()

@end

@implementation ShangchuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor systemGray6Color];
    self.navigationItem.title = @"上传";
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.btn4 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn4.frame = CGRectMake(10, 110, 206.5, 150);
    
    //[self.btn.layer setBorderWidth:1.0];
    //[self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btn4 setTitle:@"选择图片" forState:UIControlStateNormal];
    [self.btn4 setTintColor:[UIColor whiteColor]];
    [self.btn4 setBackgroundColor:[UIColor grayColor]];
    self.btn4.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.btn4 addTarget:self action:@selector(pressBtn4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn4];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zuobiaofill"]];
    self.imageView.frame = CGRectMake(230, 150, 30, 30);
    [self.view addSubview:self.imageView];
    
    self.btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn3.frame = CGRectMake(270, 150, 100, 30);
    [self.btn3.layer setCornerRadius:10.0];
    [self.btn3.layer setMasksToBounds:YES];
    [self.btn3 setTitle:@"陕西省，西安市" forState:UIControlStateNormal];
    [self.btn3 setTintColor:[UIColor whiteColor]];
    [self.btn3 setBackgroundColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1]];
    self.btn1.titleLabel.font = [UIFont systemFontOfSize:8];
    [self.view addSubview:self.btn3];
    
    for (int i = 0; i < 8; i++) {
        self.array  = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/iocn", @"插画/手绘", @"虚拟/设计", @"影视", @"摄影", @"其他", nil];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(10 + (i % 4) *95.75, 280 + (i / 4) * 50, 85.75, 40);        [self.btn.layer setCornerRadius:4.0];
        [self.btn.layer setMasksToBounds:YES];
        //[self.btn.layer setBorderWidth:1.0];
        //[self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.btn setTitle:self.array[i] forState:UIControlStateNormal];
        [self.btn setTintColor:[UIColor blackColor]];
        [self.btn setBackgroundColor:[UIColor whiteColor]];
        self.btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.btn];
    }
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(0, 390, 393, 30);
    self.textFiled.placeholder = @"作品名称";
    self.textFiled.textColor = [UIColor grayColor];
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
    
    self.textFiled1  = [[UITextField alloc] init];
    self.textFiled1.frame = CGRectMake(0, 450, 393, 80);
    self.textFiled1.placeholder = @"请添加作品说明/文章内容";
    self.textFiled1.textColor = [UIColor grayColor];
    self.textFiled1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled1];
    
    self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn2.frame = CGRectMake(10,540, 373, 50);
    [self.btn2 setTitle:@"发布" forState:UIControlStateNormal];
    [self.btn2 setTintColor:[UIColor whiteColor]];
    [self.btn2 setBackgroundColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1]];
    self.btn1.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.btn2];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(230, 190, 100, 25) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MyTableViewCell5 class] forCellReuseIdentifier:@"111"];
    
    self.btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn5.frame = CGRectMake(340, 190, 30, 30);
    [self.btn5 setImage:[UIImage imageNamed:@"angle-circle-fill-left"] forState:UIControlStateNormal];
    [self.btn5 addTarget:self action:@selector(pressBtn5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn5];
    
    self.array2 = [NSMutableArray arrayWithObjects:@"原创作品", @"设计资料", @"设计师观点", @"设计教程", nil];
    /*self.label1 = [[UILabel alloc] init];
    self.label1.text = [NSString stringWithFormat:@"%ld",self.i];
    self.label1.tintColor = [UIColor yellowColor];
    self.label1.frame = CGRectMake(196.5, 0, 10, 10);
    [self.imageView1 addSubview:self.label1];*/
    self.array1 = [NSMutableArray array];
    self.i = 0;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.btn5.selected == YES) {
        return 4;
    } else {
        return 1;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 25;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    }
    if (self.btn5.selected == NO) {
        cell.textLabel.text = self.array2[self.i];
    }
    if (self.btn5.selected == YES) {
        cell.textLabel.text = self.array2[indexPath.row];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        self.i = indexPath.row;
        self.btn5.selected  = NO;
        [self.btn5 setImage:[UIImage imageNamed:@"angle-circle-fill-left"] forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(230, 190, 100, 25);
        [self.tableView reloadData];
        
    }
}
- (void) pressBtn {
    
}
- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)pressBtn:(UIButton*) btn {
    
    if (btn.tintColor == [UIColor blackColor]) {
        [btn setTintColor:[UIColor whiteColor] ];
        [btn setBackgroundColor:[UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1]];
        
    } else {
        [btn setTintColor:[UIColor blackColor]];
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
}
-  (void)pressBtn4 {
    PictureViewController* pictureView  = [[PictureViewController alloc] init];
    pictureView.array1 = [NSMutableArray array];
    [pictureView.array1 addObjectsFromArray:self.array1];
    pictureView.delegate = self;
    [self.navigationController pushViewController:pictureView animated:YES];
}
- (void)passImage:(NSMutableArray*)array {
    [self.array1 addObjectsFromArray:array];
    self.label1 = [[UILabel alloc] init];
    self.view1 = [[UIView alloc] init];
    self.view1.backgroundColor = [UIColor yellowColor];
    self.view1.frame = CGRectMake(196.5, 110, 20, 20);
    [self.view addSubview:self.view1];
    self.label1.text = [NSString stringWithFormat:@"%ld",self.array1.count];
    self.label1.tintColor = [UIColor blackColor];
    self.label1.frame = CGRectMake(2, 2, 15, 15);
    self.imageView1 = [[UIImageView alloc] initWithImage:self.array1[0]];
    self.imageView1.frame = CGRectMake(10, 110, 206.5, 150);
    [self.view addSubview:self.imageView1];
    [self.view addSubview:self.view1];
    [self.view1 addSubview:self.label1];
    
}

- (void)pressBtn5 {
    self.btn5.selected = !self.btn5.selected;
    if (self.btn5.selected == YES) {
        [self.btn5 setImage:[UIImage imageNamed:@"yuanjiantouxia"] forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(230, 190, 100, 100);
    }
    if (self.btn5.selected == NO) {
        [self.btn5 setImage:[UIImage imageNamed:@"angle-circle-fill-left"] forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(230, 190, 100, 25);
    }
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
