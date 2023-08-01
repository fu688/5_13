//
//  SearchViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "SearchViewController.h"
#import "SearchReasultViewController.h"
#import "ShangchuanViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"搜索";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor systemGray6Color];
    
    UINavigationBarAppearance* apperance = [UINavigationBarAppearance new];
    [apperance configureWithOpaqueBackground];
    apperance.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    apperance.shadowColor = [UIColor clearColor];
    self.navigationController.navigationBar.standardAppearance = apperance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.standardAppearance;
    
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shangchuan"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = btnNext;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(10, 110, 373, 50);
    self.textFiled.placeholder = @"搜索 用户民 作品分类 文章";
    self.textFiled.textColor = [UIColor blackColor];
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
    self.btn1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btn1 setImage:[UIImage imageNamed:@"search_button"] forState:UIControlStateNormal];
    [self.btn1 addTarget:self action:@selector(pressSea) forControlEvents:UIControlEventTouchUpInside];
    self.textFiled.leftView  = self.btn1;
    self.textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    for (int i = 0; i < 3; i++) {
        //self.array1  = [NSArray arrayWithObjects:@"分类", @"推荐", @"时间", nil];
        self.view1 = [[UIView alloc] init];
        self.view1.frame = CGRectMake(10, 220 + i * 150 - 30, 80, 30);
        self.view1.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        [self.view addSubview:self.view1];
        self.label = [[UILabel alloc] init];
        if (i == 0) {
            self.label.text = @"分类";
        }
        if (i == 1) {
            self.label.text = @"推荐";
        }
        if (i == 2) {
            self.label.text = @"时间";
        }
        //self.label.text = self.array1[i];
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont systemFontOfSize:20];
        self.label.frame = CGRectMake(10, 5, 50, 20);
        [self.view1 addSubview:self.label];
        self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_line"]];
        self.imageView1.frame = CGRectMake(10, 220 + i * 150, 373 , 5);
        [self.view addSubview:self.imageView1];
    }
    for (int i = 0; i < 8; i++) {
        self.array  = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/iocn", @"插画/手绘", @"虚拟/设计", @"影视", @"摄影", @"其他", nil];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(10 + (i % 4) *95.75, 230 + (i / 4) * 50, 85.75, 40);
        [self.btn.layer setCornerRadius:4.0];
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
    for (int i = 0; i < 4; i++) {
        self.array  = [NSArray arrayWithObjects:@"人气最多", @"收藏最多", @"评论最多", @"编辑精选", nil];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(10 + (i % 4) *95.75, 380, 85.75, 40);
        [self.btn.layer setCornerRadius:4.0];
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
    for (int i = 0; i < 4; i++) {
        self.array  = [NSArray arrayWithObjects:@"30分钟前", @"一小时前", @"一个月前", @"一年前", nil];
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btn.frame = CGRectMake(10 + (i % 4) *95.75, 530, 85.75, 40);
        [self.btn.layer setCornerRadius:4.0];
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
- (void)pressSea {
    SearchReasultViewController* reasultView = [[SearchReasultViewController alloc] init];
    reasultView.text = self.textFiled.text;
    [self.navigationController pushViewController:reasultView animated:YES];
}
- (void) pressRight {
    ShangchuanViewController* shangchuanView = [[ShangchuanViewController alloc] init];
    [self.navigationController pushViewController:shangchuanView animated:YES];
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
