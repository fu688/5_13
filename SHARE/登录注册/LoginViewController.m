//
//  LoginViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomepageViewController.h"
#import "SearchViewController.h"
#import "PassageViewController.h"
#import "ActivityVIewController.h"
#import "MysViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UIColor *color = [UIColor colorWithRed:79 / 225.0f green:141 / 141.0f blue:198 / 141.0f alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kaiji1"]];
    self.imageView.frame = self.view.bounds;
    //[self.view addSubview:self.imageView];
    
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    self.imageView1.frame = CGRectMake(121.5, 150, 150, 150);
    [self.view addSubview:self.imageView1];
    
    self.label = [[UILabel alloc] init];
    self.label.text = @"SHARE";
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:40];
    self.label.frame = CGRectMake(130, 320, 150, 40);
    [self.view addSubview:self.label];
    
    self.textFiled  = [[UITextField alloc] init];
    self.textFiled.frame = CGRectMake(46.5, 400, 300, 50);
    self.textFiled.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled];
    
    self.textFiled1  = [[UITextField alloc] init];
    self.textFiled1.frame = CGRectMake(46.5, 470, 300, 50);
    self.textFiled1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textFiled1];
    
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghu"]];
    self.textFiled.leftView  = self.imageView2;
    self.textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiesuo"]];
    self.textFiled1.leftView = self.imageView3;
    self.textFiled1.leftViewMode = UITextFieldViewModeAlways;
    
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(96.5, 540, 100, 40);
    [self.btn.layer setCornerRadius:8.0];
    [self.btn.layer setMasksToBounds:YES];
    [self.btn.layer setBorderWidth:1.0];
    [self.btn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btn setTitle:@"登录" forState:UIControlStateNormal];
    [self.btn setTintColor:[UIColor whiteColor]];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn1.frame = CGRectMake(240.5, 540, 100, 40);
    [self.btn1.layer setCornerRadius:8.0];
    [self.btn1.layer setMasksToBounds:YES];
    [self.btn1.layer setBorderWidth:1.0];
    [self.btn1.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.btn1 setTitle:@"注册" forState:UIControlStateNormal];
    [self.btn1 setTintColor:[UIColor whiteColor]];
    self.btn1.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.btn1 addTarget:self action:@selector(pressBtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];
    
    self.array1 = [NSMutableArray array];
    self.array2 = [NSMutableArray array];
}
- (void)registerReturn:(NSString *)namestr andPass:(NSString *)passStr {
    [self.array1 addObject:namestr];
    [self.array2 addObject:passStr];
}
- (void)pressBtn1 {
    RegisterViewController* registerView = [[RegisterViewController alloc] init];
    registerView.array1 = [NSMutableArray array];
    registerView.array2 = [NSMutableArray array];
    [registerView.array1 addObjectsFromArray:self.array1];
    [registerView.array2 addObjectsFromArray:self.array2];
    //NSLog(@"%@", self.array1[0]);
    registerView.modalPresentationStyle = 0;
    registerView.delegate = self;
    [self presentViewController:registerView animated:YES completion:nil];
}
- (void)pressBtn {
    int j  = 0;
    for (int i = 0; i < self.array1.count; i++) {
        if ([self.textFiled.text isEqualToString:self.array1[i]] && [self.textFiled1.text isEqualToString:self.array2[i]]) {
            NSLog(@"%@", self.array1[i]);
            j = 1;
        }
    }
    if (j == 0) {
        self.alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"账号或密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
        [self.alert addAction:action];
        [self presentViewController:self.alert animated:YES completion:nil];
    } else  {
        HomepageViewController* homeView = [[HomepageViewController alloc] init];
        UINavigationController* naHomePageView  = [[UINavigationController alloc] initWithRootViewController:homeView];
        
        SearchViewController* searchView = [[SearchViewController alloc] init];        UINavigationController* naSearchView  = [[UINavigationController alloc] initWithRootViewController:searchView];
        
        PassageViewController* passageView = [[PassageViewController alloc] init];
        UINavigationController* naPassageView  = [[UINavigationController alloc] initWithRootViewController:passageView];
        
        ActivityVIewController* activityView = [[ActivityVIewController alloc] init];
        UINavigationController* naActivityView  = [[UINavigationController alloc] initWithRootViewController:activityView];
        
        MysViewController* mysView = [[MysViewController alloc] init];
        UINavigationController* naMysView  = [[UINavigationController alloc] initWithRootViewController:mysView];
        
        UITabBarController * tbController  = [[UITabBarController alloc] init];
        NSArray* array = [NSArray arrayWithObjects:naHomePageView, naSearchView, naPassageView, naActivityView, naMysView, nil];
        tbController.viewControllers = array;
        tbController.tabBar.backgroundColor = [UIColor blackColor];
        
        UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
        NSArray<UIWindow *> *windows = windowScene.windows;
        UIWindow *window = windows.firstObject;
        window.rootViewController = tbController;
        
        homeView.tabBarItem = [[UITabBarItem alloc]
            initWithTitle:nil image:[[UIImage imageNamed:@"56"]imageWithRenderingMode:
            UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
            @"button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        searchView.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button2_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        passageView.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button3_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button3_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        activityView.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button4_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button4_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        mysView.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button5_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button5_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
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
