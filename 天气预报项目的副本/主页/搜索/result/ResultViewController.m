//
//  ResultViewController.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/2.
//

#import "ResultViewController.h"
#import "WhetherTableViewCell.h"
#import "HomreViewController.h"
#import "SearchViewController.h"
@interface ResultViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view.
    /*self.navigationController.navigationBar.backgroundColor = [UIColor systemBlueColor];
    UIBarButtonItem* btnNext = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = btnNext;
    self.navigationItem.rightBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];*/
    
    
    
    self.view.backgroundColor = [UIColor blueColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 393, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.backgroundView  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
    self.tableView.backgroundColor = [UIColor systemBlueColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"000"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"111"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"222"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"333"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"444"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"555"];
    [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"666"];
    [self.view addSubview:self.tableView];
    self.mainDictionary = [NSDictionary dictionary];
    
    self.backgroudImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
    //NSLog(@"%@", self.cityName);
    [self createUrl];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(300, 50, 50, 50);
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 50, 50, 50);
    [btn1 setTitle:@"取消" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 300;
    } else if (indexPath.row == 1) {
        return 150;
    } else if (indexPath.row >= 2 && indexPath.row <= 7) {
        return 40;
    } else{
        return 60;
    }
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
        if (indexPath.row == 0) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000" forIndexPath:indexPath];
            cell.cityLabel.text = self.cityName;
            cell.cityLabel.font = [UIFont systemFontOfSize:40];
            cell.weaLabel.text = self.wheString;
            cell.weaLabel.font = [UIFont systemFontOfSize:20];
            cell.temLabel.text = self.temString;
            cell.temLabel.font = [UIFont systemFontOfSize:120];
            cell.weekLabel.text = self.dayString;
            cell.weekLabel.font = [UIFont systemFontOfSize:30];
            cell.hightemLabel.text = self.highTemString;
            cell.hightemLabel.font = [UIFont systemFontOfSize:25];
            cell.lowtemLabel.text = self.lowTemstring;
            cell.lowtemLabel.font = [UIFont systemFontOfSize:25];
            //cell.backgroundColor  = [UIColor systemGray6Color];
            //cell.backgroundView = self.backgroudImageView;
            cell.backgroundColor =[UIColor clearColor];
            return cell;
        } else if (indexPath.row == 1){
            WhetherTableViewCell*  cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
            self.scrollView = [[UIScrollView alloc] init];
            self.scrollView.frame  = CGRectMake(0, 0, 393, 150);
            self.scrollView.scrollEnabled = YES;
            //self.timearray = [[NSMutableArray alloc] init];
            //NSLog(@"111%@", self.timearray);
            self.scrollView.contentSize = CGSizeMake(98.25 * self.timeArray.count, 150);
            [cell.contentView addSubview:self.scrollView];
            for (int i = 0; i < self.timeArray.count; i++) {
                
                UILabel *label = [[UILabel alloc] init];
                label.frame = CGRectMake(20 + 98.5 * i, 10, 98.5, 30);
                [self.scrollView addSubview:label];
                label.text = self.timeArray[i];
                label.textColor = [UIColor whiteColor];
                
                UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.wea_img0Array[i]]]];
                imageView.frame = CGRectMake(20 + 98.5 * i, 55, 40, 40);
                [self.scrollView addSubview:imageView];
                
                UILabel *label1 = [[UILabel alloc] init];
                label1.frame = CGRectMake(20 + 100 * i, 110, 98.5, 30);
                [self.scrollView addSubview:label1];
                label1.text = self.hourTemArray[i];
                label1.textColor = [UIColor whiteColor];
            }
            cell.backgroundColor = [UIColor clearColor];
                //self.timeLabel = [[UILabel alloc] init];
                
                //self.houreWeaImageView = [[UIImageView alloc] init];
                //self.houretemLabel = [[UILabel alloc] init];
                    
                //self.timeLabel.text = self.timeArray[i];
                //NSLog(@"111111111%@", self.timeArray);
                //self.timeLabel.font = [UIFont systemFontOfSize:30];
                //self.timeLabel.frame = CGRectMake(20 + 98.5 * i, 10, 98.5, 30);
                //self.timeLabel.textColor = [UIColor whiteColor];
                //[self.scrollView addSubview:self.timeLabel];
                
//                self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.imageViewArray[i]]];
//                self.imageView.frame = CGRectMake(20 + 98.5 * i, 55, 40, 40);
//                [self.scrollView addSubview:self.imageView];
//
//                self.houretemLabel.text = self.houreTemArray[i];
//                self.houretemLabel.font = [UIFont systemFontOfSize:30];
//                self.houretemLabel.frame = CGRectMake(20 + 98.5 * i, 110, 98.5, 30);
//                self.houretemLabel.textColor = [UIColor systemGray6Color];
//                [self.scrollView addSubview:self.houretemLabel];
            //[cell setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2]];
            //cell.backgroundColor  = [UIColor clearColor];
            return cell;
        } else if (indexPath.row >= 2 && indexPath.row <= 7){
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
            cell.weeklabel1.text = self.dayArray[indexPath.row - 2];
            cell.weeklabel1.textColor = [UIColor whiteColor];
            cell.dayWeaImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.wea_imgArary[indexPath.row - 2]]];
            cell.dayHightemLabel.text = self.tem1Array[indexPath.row  - 2];
            cell.dayHightemLabel.textColor = [UIColor whiteColor];
            cell.dayLowtemLabel.text = self.tem2Array[indexPath.row  - 2];
            cell.dayLowtemLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        } else if (indexPath.row == 8) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
            cell.air_tipsLabel.text = self.air_tipsString;
            cell.air_tipsLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        } else if (indexPath.row == 9) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444" forIndexPath:indexPath];
            cell.sunriseLabel.text = self.sunriseString;
            cell.sunriseLabel.textColor = [UIColor whiteColor];
            cell.sunsetLabel.text = self.sunsetString;
            cell.sunsetLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        }else if (indexPath.row == 10) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"555" forIndexPath:indexPath];
            cell.humidityLabel.text  = self.humidityString;
            cell.humidityLabel.textColor = [UIColor whiteColor];
            cell.air_levelLabel.text = self.air_levelString;
            cell.air_levelLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        } else {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"666" forIndexPath:indexPath];
            cell.visibilityLabel.text = self.visibilityString;
            cell.visibilityLabel.textColor = [UIColor whiteColor];
            cell.pressureLabel.text = self.pressureString;
            cell.pressureLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        }
}
- (void) createUrl {
    //NSLog(@"%@", _cityName);
    // 地址（我这里的cityID是外部传进来的字符串，代表查询城市的id）
    //self.cityName = @"西安";
    NSString* urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=81453197&appsecret=1LT6V1Da&city=%@", self.cityName];
    
    // 对中文和空格字符编码解码
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    // 设置请求地址
    NSURL* url = [NSURL URLWithString:urlString];
    
    // 创建请求类
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    // 创建会话
    NSURLSession* seesion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 根据会话创建任务
    NSURLSessionTask* dataTask = [seesion dataTaskWithRequest:request];
    
    // 启动任务
    [dataTask resume];
    
}
// URL协议方法
 
// 接收的服务器的响应
- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveResponse:(nonnull NSURLResponse *)response completionHandler:(nonnull void (^)(NSURLSessionResponseDisposition))completionHandler {
    
    // 判断data是否使用过
    if (self.data == nil) {
        // 未使用过初始化data
        self.data = [[NSMutableData alloc] init];
    } else {
        // 使用过清空上次使用的数据
        self.data.length = 0;
    }
    // 允许接收数据
    completionHandler(NSURLSessionResponseAllow);
}
 
// 接收数据时调用，会被调用多次
- (void) URLSession:(NSURLSession*)session dataTask:(nonnull NSURLSessionDataTask *)dataTask didReceiveData:(nonnull NSData *)data {
    // 拼接数据
    [self.data appendData:data];
}
 
// 数据请求完成 或请求出现错误时调用
- (void) URLSession:(NSURLSession*)session task:(nonnull NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
    if (error == nil) {
        // 解析数据，将data转换成OC对象，返回的是一个字典
        // 用于接收的字典我在别的方法内已经初始化。若没有初始化字典，接收到的永远都是空值。
        _mainDictionary = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:nil];
        if (_mainDictionary != nil) {
            
            
            self.nameString = _mainDictionary[@"city"];
            //NSLog(@"%@", self.nameString);
            self.wheString  = _mainDictionary[@"data"][0][@"wea"];
            self.temString  = _mainDictionary[@"data"][0][@"tem"];
            self.dayString = _mainDictionary[@"data"][0][@"week"];
            self.highTemString = _mainDictionary[@"data"][0][@"tem1"];
            self.lowTemstring = _mainDictionary[@"data"][0][@"tem2"];
            
            timeArray = [[NSMutableArray alloc] init];
            timeArray = _mainDictionary[@"data"][0][@"hours"];
            self.timeArray = [[NSMutableArray alloc] init];
            for (int i = 0; i < timeArray.count; i++) {
                [self.timeArray addObject:_mainDictionary[@"data"][0][@"hours"][i][@"hours"]];
                //NSLog(@"%@", self.timeArray[i]);
            }
            self.wea_img0Array = [[NSMutableArray alloc] init];
            for (int i = 0; i < timeArray.count; i++) {
                [self.wea_img0Array addObject:_mainDictionary[@"data"][0][@"hours"][i][@"wea_img"]];
            }
            self.hourTemArray = [[NSMutableArray alloc] init];
            for (int i = 0; i < timeArray.count; i++) {
                [self.hourTemArray addObject:_mainDictionary[@"data"][0][@"hours"][i][@"tem"]];
            }
            
            NSMutableArray* array = _mainDictionary[@"data"];
            self.dayArray = [[NSMutableArray array] init];
            for (int i = 1; i < array.count; i++) {
                [self.dayArray addObject:_mainDictionary[@"data"][i][@"week"]];
            }
            self.wea_imgArary = [[NSMutableArray alloc] init];
            for (int i = 1; i < array.count; i++) {
                [self.wea_imgArary addObject:_mainDictionary[@"data"][i][@"wea_img"]];
            }
            self.tem1Array = [[NSMutableArray alloc] init];
            for (int i = 1; i < array.count; i++) {
                [self.tem1Array addObject:_mainDictionary[@"data"][i][@"tem1"]];
            }
            self.tem2Array = [[NSMutableArray alloc] init];
            for (int i = 1; i < array.count; i++) {
                [self.tem2Array addObject:_mainDictionary[@"data"][i][@"tem2"]];
            }
            self.air_tipsString = _mainDictionary[@"data"][0][@"air_tips"];
            self.sunriseString = _mainDictionary[@"data"][0][@"sunrise"];
            self.sunsetString = _mainDictionary[@"data"][0][@"sunset"];
            self.humidityString  = _mainDictionary[@"data"][0][@"humidity"];
            self.air_levelString = _mainDictionary[@"data"][0][@"air_level"];
            self.visibilityString = _mainDictionary[@"data"][0][@"visibility"];
            self.pressureString = _mainDictionary[@"data"][0][@"pressure"];
        }
        /*timeArray = [[NSMutableArray alloc] init];
        timeArray = _mainDictionary[@"data"][0][@"pchilds"][0][@"cchilds"];
        for (int i = 0; i < timeArray.count; i++) {
            NSMutableString *str = [NSMutableString stringWithFormat:@"%@-%@-%@",_mainDictionary[@"data"][0][@"name"],   _mainDictionary[@"data"][0][@"pchilds"][0][@"name"],timeArray[i][@"name"]];
            
        }*/
        /*for (int i = 0; i < cityArray.count; i++) {
            NSLog(@"%@", cityArray[i]);
        }*/
    } else {
        // 请求失败，打印错误
        NSLog(@"%@", error);
    }/*    // 请求成功
    if (error == nil) {
        // 解析数据，将data转换成OC对象，返回的是一个字典
        // 用于接收的字典我在别的方法内已经初始化。若没有初始化字典，接收到的永远都是空值。
        _mainDictionary = [NSJSONSerialization JSONObjectWithData:_data options:kNilOptions error:nil];
        //NSMutableString *str = [NSMutableString stringWithFormat:@"%@",_mainDictionary[@"aqi"][0][@"air"]];
        //NSLog(@"%@", str);
    } else {
        // 请求失败，打印错误
        NSLog(@"%@", error);
    }*/
    
    // 回到主线程（进行其他操作）
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        // 打印接收到的字典，确认请求是否成功
        //NSLog(@"dict = %@", self->_mainDictionary);
        [self->_tableView reloadData];
    }];
    
}
- (void)pressRight {
    for (int i = 0; i < self.passCity1Array.count; i++) {
        if ([self.passCity1Array[i] isEqualToString:self.cityName]) {
            self.alert = [UIAlertController alertControllerWithTitle:@"警告⚠️" message:@"该城市一存在" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
            [self.alert addAction:action];
            [self presentViewController:self.alert animated:YES completion:nil];
            return;
        }
    }
    NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.cityName, @"key", nil];
   
    //HomreViewController* homeView = [[HomreViewController alloc] init];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pass" object:nil userInfo:dictionary];
//    NSLog(@"%@", dictionary[@"key"]);
    //homeView.modalPresentationStyle = NO;
    UIViewController *vc =  self;
    while (vc.presentingViewController) {
            vc = vc.presentingViewController;
        }
    [vc dismissViewControllerAnimated:YES completion:nil];
    //[self dismissModalViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pressLeft {
    /*SearchViewController* searchView = [[SearchViewController alloc] init];
    UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    NSArray<UIWindow *> *windows = windowScene.windows;
    UIWindow *window = windows.firstObject;
    window.rootViewController = searchView;*/
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
