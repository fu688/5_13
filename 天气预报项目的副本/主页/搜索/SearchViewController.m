//
//  SearchViewController.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import "SearchViewController.h"
#import "CityTableViewCell.h"
#import "ResultViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor systemBlueColor];
    UIImage *backImage = [UIImage imageNamed:@"image1.jpg"];
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
        backImageView.frame = self.view.bounds;
        [self.view insertSubview:backImageView atIndex:0];
    
    textField = [[UITextField alloc] init];
    textField.delegate = self;
    textField.frame = CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 100, 50);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.backgroundColor = [UIColor whiteColor];
    textField.delegate = self;
    [self.view addSubview:textField];
    
    cityArray = [[NSMutableArray alloc] init];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(50, 150, 293, 30 * cityArray.count);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:@"111"];
    [self.view addSubview:self.tableView];
    
    self.str = @"西安";
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 50, 50, 50);
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressleft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //_mainDictionary = [[NSDictionary alloc] init];
    [self creatUrl];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"%ld",self->cityArray.count);
    return cityArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    if (!cell) {
        cell = [[CityTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    }
    /*while ([cell.contentView.subviews lastObject] != nil) {
        [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
    }*/
    //NSLog(@"222");
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = cityArray[indexPath.row];
    //NSLog(@"%@", cell.textLabel.text);
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    //cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ResultViewController* resultView = [[ResultViewController alloc] init];
    resultView.cityName = timeArray[indexPath.row][@"adm2"];
    resultView.passCity1Array = self.cityPassArray;
    //self.sv.contentOffset = CGPointMake(350, 0);
    /*UINavigationController* naResultView = [[UINavigationController alloc] initWithRootViewController:resultView];
    
    UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    NSArray<UIWindow *> *windows = windowScene.windows;
    UIWindow *window = windows.firstObject;
    window.rootViewController = naResultView;*/
    unichar dashCharacter = '-';
    for (NSUInteger i = 0; i < [cityArray[indexPath.row] length]; i++) {
        unichar character = [cityArray[indexPath.row] characterAtIndex:i];
        if (character == dashCharacter) {
                //NSLog(@"字符和 '-' 相等");
            resultView.cityName = [cityArray[indexPath.row] substringWithRange:NSMakeRange(i + 1, [cityArray[indexPath.row] length] - i - 1)];
                break;
            }
    }
    
    

    resultView.modalPresentationStyle = NO;
    [self presentViewController:resultView animated:YES completion:nil];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _mainDictionary = [[NSDictionary alloc] init];
    [self creatUrl];
    return YES;
}
- (void)creatUrl {
    //1.创建请求地址
    //NSLog(@"111");
    NSString *urlString = [NSString stringWithFormat:@"https://geoapi.qweather.com/v2/city/lookup?location=%@&range=cn&key=5af07eccd3cf4e459fc3df6eba6d615d",textField.text];
    //处理字符range
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //创建URL
    NSURL *url = [NSURL URLWithString:urlString];
    //NSLog(@"%@1111", urlString);
    //2.创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //3.创建会话
    //delegateQueue 表示协议方法在哪个线程中执行
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self  delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话创建任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    //5.启动任务
    [dataTask resume];
}
//接收服务器的响应
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    //NSLog(@"didReceiveResponse");
    
    if(data1 == nil){
        data1 = [[NSMutableData alloc] init];
    } else {
        data1.length = 0;
    }
    //允许接收数据
    completionHandler(NSURLSessionResponseAllow);
}
//接收到数据，该方法会被调用多次
- (void)URLSession:(NSURLSession *)session dataTask:( NSURLSessionDataTask *)dataTask didReceiveData:( NSData *)data {
    //NSLog(@"didReceiveData");
    [data1 appendData:data];
    //NSLog(@"%@", data);
}
//数据请求完成或者请求出现错误调用的方法
- (void)URLSession:(NSURLSession *)session task:( NSURLSessionTask *)task didCompleteWithError:( NSError *)error {
    /*NSLog(@"didCompleteWithError");
    NSLog(@"%@", data1);
    if (error == nil) {
        //解析数据
        NSDictionary *secondDictionary = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:nil];
        NSMutableArray *timeArray = [[NSMutableArray alloc] init];
        timeArray = secondDictionary[@"data"][0][@"name"];
        for (int i = 0; i < timeArray.count; i++) {
            NSMutableString *str = [NSMutableString stringWithFormat:@"%@-%@",timeArray[],timeArray[i][@"location"]];
            [cityArray addObject: str];
        }
        for (int i = 0; i < cityArray.count; i++) {
            NSLog(@"%@", cityArray[i]);
        }
        NSLog(@"-----------over");
    } else {
        NSLog(@"error = %@", error);
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self->tableView reloadData];
    }];*/
    if (error == nil) {
        // 解析数据，将data转换成OC对象，返回的是一个字典
        // 用于接收的字典我在别的方法内已经初始化。若没有初始化字典，接收到的永远都是空值。
        _mainDictionary = [NSJSONSerialization JSONObjectWithData:data1 options:kNilOptions error:nil];
        //NSLog(@"%@", _mainDictionary);
        timeArray = [[NSMutableArray alloc] init];
        timeArray = _mainDictionary[@"location"];
        for (int i = 0; i < timeArray.count; i++) {
            if ([timeArray[i][@"adm2"] length] == 2) {
                NSMutableString *str = [NSMutableString stringWithFormat:@"%@-%@",timeArray[i][@"adm1"] ,timeArray[i][@"adm2"]];
                [cityArray addObject: str];
            }
        }
        for (int i = 0; i < cityArray.count; i++) {
            //NSLog(@"%@", cityArray[i]);
        }
    } else {
        // 请求失败，打印错误
        //NSLog(@"%@", error);
    }
    // 回到主线程（进行其他操作）
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        // 打印接收到的字典，确认请求是否成功
        //NSLog(@"111111");
        //NSLog(@"%ld",self->cityArray.count);
        self->_tableView.frame = CGRectMake(50, 150, 293, 30 * self->cityArray.count);
        [self->_tableView reloadData];
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [textField endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField endEditing:YES];
    return YES;
}
- (void)pressleft {
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
