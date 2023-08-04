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
    tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 150 * cityNameArray.count);
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonAdd setImage:[UIImage imageNamed:@"tianjia"] forState:UIControlStateNormal];
    buttonAdd.frame  = CGRectMake(350, 50 + 150 * cityNameArray.count + 10, 40, 40);
    [buttonAdd addTarget:self action:@selector(pressButtonAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAdd];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiReceived:) name:@"pass" object:nil];
    self.array = [[NSMutableArray alloc] init];
//    NSLog(@"%ld", cityNameArray.count);
    for (int i = 0; i < cityNameArray.count; i++) {
        
        [self createUrl:i];
    
        [tableView reloadData];
//        NSLog(@"888888888888");
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
                /*self->_nameString = self->_mainDictionary[@"city"];
                NSLog(@"%@", self.nameString);
                self->_wheString  = self->_mainDictionary[@"data"][0][@"wea"];
                self->_temString  = self->_mainDictionary[@"data"][0][@"tem"];
                self->_dayString = self->_mainDictionary[@"data"][0][@"week"];
                self->_highTemString = self->_mainDictionary[@"data"][0][@"tem1"];
                self->_lowTemstring = self->_mainDictionary[@"data"][0][@"tem2"];
                
                self->timeArray = [[NSMutableArray alloc] init];
                self->timeArray = self->_mainDictionary[@"data"][0][@"hours"];
                self->timeArray = [[NSMutableArray alloc] init];
                for (int i = 0; i < self->timeArray.count; i++) {
                    [self->timeArray addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"hours"]];
                    //NSLog(@"%@", self.timeArray[i]);
                }
                self.wea_img0Array = [[NSMutableArray alloc] init];
                for (int i = 0; i < self->timeArray.count; i++) {
                    [self->_wea_img0Array addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"wea_img"]];
                }
                self.hourTemArray = [[NSMutableArray alloc] init];
                for (int i = 0; i < self->timeArray.count; i++) {
                    [self->_hourTemArray addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"tem"]];
                }
                
                NSMutableArray* array = self->_mainDictionary[@"data"];
                self->_dayArray = [[NSMutableArray array] init];
                for (int i = 1; i < array.count; i++) {
                    [self->_dayArray addObject:self->_mainDictionary[@"data"][i][@"week"]];
                }
                self.wea_imgArary = [[NSMutableArray alloc] init];
                for (int i = 1; i < array.count; i++) {
                    [self->_wea_imgArary addObject:self->_mainDictionary[@"data"][i][@"wea_img"]];
                }
                self.tem1Array = [[NSMutableArray alloc] init];
                for (int i = 1; i < array.count; i++) {
                    [self->_tem1Array addObject:self->_mainDictionary[@"data"][i][@"tem1"]];
                }
                self.tem2Array = [[NSMutableArray alloc] init];
                for (int i = 1; i < array.count; i++) {
                    [self->_tem2Array addObject:self->_mainDictionary[@"data"][i][@"tem2"]];
                }
                self->_air_tipsString = self->_mainDictionary[@"data"][0][@"air_tips"];
                self->_sunriseString = self->_mainDictionary[@"data"][0][@"sunrise"];
                self->_sunsetString = self->_mainDictionary[@"data"][0][@"sunset"];
                self->_humidityString  = self->_mainDictionary[@"data"][0][@"humidity"];
                self->_air_levelString = self->_mainDictionary[@"data"][0][@"air_level"];
                self->_visibilityString = self->_mainDictionary[@"data"][0][@"visibility"];
                self->_pressureString = self->_mainDictionary[@"data"][0][@"pressure"];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSLog(@"111");
                    NSLog(@"%d", i);
                        self->_tableView = [[UITableView alloc] initWithFrame:CGRectMake(393 * i, 0, 393, self.view.bounds.size.height) style:UITableViewStyleGrouped];
                        //self.tableView.backgroundView  = [[UIImageView init] initWithImage:[UIImage imageNamed:@"image1"]];
                        //self.tableView.backgroundColor = [UIColor systemBlueColor];
                        self->_tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
                        self->_tableView.delegate = self;
                        self->_tableView.dataSource = self;
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"000"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"111"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"222"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"333"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"444"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"555"];
                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"666"];
                                //NSLog(@"%@", self.cityName);
                        //[self->_tableView reloadData];
                        [self->_scrollView addSubview:self->_tableView];
                        [self->_tableView reloadData];
                         
                    // [self.scrollView addSubview:self.tableView];
                    
                }];*/
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
}
    
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}*/
    
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XinXiTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[XinXiTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.labelCity.text = cityNameArray[indexPath.row];
    cell.labelCity.textColor = [UIColor whiteColor];
    cell.labelCity.font = [UIFont systemFontOfSize:40];
    
    cell.imageViewWhether.image = [UIImage imageNamed:[NSString stringWithFormat:@"weth_%ld",indexPath.row + 1]];
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
    tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 150 * cityNameArray.count);
    buttonAdd.frame  = CGRectMake(350, 50 + 150 * cityNameArray.count + 10, 40, 40);
    
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
