//
//  HomreViewController.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import "HomreViewController.h"
#import "XinXiTableViewCell.h"
#import "SearchViewController.h"
#import "ScrollerViewController.h"
@interface HomreViewController ()

@end

@implementation HomreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    cityNameArray = [NSMutableArray arrayWithObjects:@"西安", nil];
    tableView = [[UITableView alloc] init];
    //tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 150 * cityNameArray.count);
    tableView.frame = self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[XinXiTableViewCell class] forCellReuseIdentifier:@"111"];
   
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiReceived:) name:@"pass" object:nil];
    self.array = [[NSMutableArray alloc] init];
    for (int i = 0; i < cityNameArray.count; i++) {
        
        [self createUrl:i];
    
        [tableView reloadData];

    }
}
- (void)createUrl:(int)i{
    NSString *urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=81453197&appsecret=1LT6V1Da&city=%@", cityNameArray[i]];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSession *sharedSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
            if(data) {
//                NSLog(@"iorqewoir");
                self->_mainDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                [self.array addObject:self->_mainDictionary];
            }
        }];
        [dataTask resume];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cityNameArray.count;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
    
/*- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}*/
    
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonAdd setImage:[UIImage imageNamed:@"tianjia"] forState:UIControlStateNormal];
    buttonAdd.frame  = CGRectMake(300, 5, 40, 40);
    [buttonAdd addTarget:self action:@selector(pressButtonAdd) forControlEvents:UIControlEventTouchUpInside];
    return buttonAdd;
}
    
/*- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}*/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}
    
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*if (indexPath.row == cityNameArray.count) {
        XinXiTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
        buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttonAdd setImage:[UIImage imageNamed:@"tianjia"] forState:UIControlStateNormal];
        buttonAdd.frame  = CGRectMake(350, 5, 40, 40);
        
        [buttonAdd addTarget:self action:@selector(pressButtonAdd) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:buttonAdd];
        return cell;
    } else {*/
        XinXiTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
        if (!cell) {
            cell = [[XinXiTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.labelCity.text = cityNameArray[indexPath.row];
        cell.labelCity.textColor = [UIColor whiteColor];
        cell.labelCity.font = [UIFont systemFontOfSize:40];
        
        cell.imageViewWhether.image = [UIImage imageNamed:[NSString stringWithString:@"weth_3"]];
        return cell;
    
}
- (void)pressButtonAdd {
    SearchViewController* searchView = [[SearchViewController alloc] init];
    
    searchView.cityPassArray = cityNameArray;
    [self presentViewController:searchView animated:YES completion:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        ScrollerViewController* scollerView = [[ScrollerViewController alloc] init];
        scollerView.dictionaryArray = self.array;
        scollerView.k = indexPath.row;
//    NSLog(@"%ld", scollerView.dictionaryArray.count);
    /*scollerView.scrollView.contentOffset = CGPointMake(393 * indexPath.row, 0);
     */
    /*UITabBarController* tabController = [[UITabBarController alloc] init];
        NSArray* array = [NSArray arrayWithObject:scollerView];
        tabController.viewControllers = array;
        UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
        NSArray<UIWindow *> *windows = windowScene.windows;
        UIWindow *window = windows.firstObject;
        window.rootViewController = tabController;*/
        scollerView.modalPresentationStyle = NO;
        [self presentViewController:scollerView animated:YES completion:nil];
}
- (void)notiReceived:(NSNotification*)notification {
    NSDictionary  *dic = notification.userInfo;
    [cityNameArray addObject:dic[@"key"]];
//    NSLog(@"%@", cityNameArray);
    //tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 150 * cityNameArray.count + 80);
    tableView.frame = self.view.bounds;
    //buttonAdd.frame  = CGRectMake(350, 50 + 150 * cityNameArray.count + 10, 40, 40);
    
    int k = (int)cityNameArray.count - 1;
    [self createUrl:k];
        
    //[self.tableView reloadData];*/
//    NSLog(@"888888888888");
    
    [tableView reloadData];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
