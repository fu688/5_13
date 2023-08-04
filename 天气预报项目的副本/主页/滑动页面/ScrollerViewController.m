//
//  ScrollerViewController.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import "ScrollerViewController.h"
#import "WhetherTableViewCell.h"
@interface ScrollerViewController ()

@end

@implementation ScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame  = self.view.bounds;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(393 * self.dictionaryArray.count, self.view.bounds.size.height);
    self.scrollView.contentOffset = CGPointMake(self.k * 393, 0);
    NSLog(@"%ld", self.dictionaryArray.count);
    self.mainDictionary = [NSDictionary dictionary];
    [self.view addSubview:self.scrollView];
    
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 50, 50, 50);
    [btn1 setImage:[UIImage imageNamed:@"mulu"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
        
    for (int i = 0; i < self.dictionaryArray.count; i++) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(393 * i , 0, 393, self.view.bounds.size.height) style:UITableViewStyleGrouped];        //self.tableView.backgroundView  = [[UIImageView init] initWithImage:[UIImage imageNamed:@"image1"]];
        //self.tableView.backgroundColor = [UIColor systemBlueColor];
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
        self.tableView.tag = i;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"000"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"111"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"222"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"333"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"444"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"555"];
        [self.tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"666"];
        //NSLog(@"%@", self.cityName);
        [self.scrollView addSubview:self.tableView];
        //[self.ableView reloadData];
        //[self createUrl:i:self.tableView];
        [self.tableView reloadData];
        //        NSLog(@"888888");
    }
    
    
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
//    NSLog(@"22222222");
    _mainDictionary = self.dictionaryArray[tableView.tag];
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
    /*self.nameString = self.mainDictionary[@"city"];
    NSLog(@"%@", self.nameString);
    self.wheString  = self.mainDictionary[@"data"][0][@"wea"];
    self.temString  = self.mainDictionary[@"data"][0][@"tem"];
    self.dayString = self.mainDictionary[@"data"][0][@"week"];
    self.highTemString = self.mainDictionary[@"data"][0][@"tem1"];
    self.lowTemstring = self.mainDictionary[@"data"][0][@"tem2"];
    
    self.timeArray = [[NSMutableArray alloc] init];
    self.timeArray = self.mainDictionary[@"data"][0][@"hours"];
    self.timeArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < self.timeArray.count; j++) {
        [self.timeArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"hours"]];
        NSLog(@"11111111");
        NSLog(@"%@", self.timeArray[j]);
    }
    self.wea_img0Array = [[NSMutableArray alloc] init];
    for (int j = 0; j < self.timeArray.count; j++) {
        [self.wea_img0Array addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"wea_img"]];
    }
    self.hourTemArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < self.timeArray.count; j++) {
        [self.hourTemArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"tem"]];
    }
    
    NSMutableArray* array = self->_mainDictionary[@"data"];
    self.dayArray = [[NSMutableArray array] init];
    for (int j = 1; j < array.count; j++) {
        [self.dayArray addObject:self.mainDictionary[@"data"][j][@"week"]];
    }
    self.wea_imgArary = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_wea_imgArary addObject:self->_mainDictionary[@"data"][j][@"wea_img"]];
    }
    self.tem1Array = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_tem1Array addObject:self->_mainDictionary[@"data"][j][@"tem1"]];
    }
    self.tem2Array = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_tem2Array addObject:self->_mainDictionary[@"data"][j][@"tem2"]];
    }
    self->_air_tipsString = self->_mainDictionary[@"data"][0][@"air_tips"];
    self->_sunriseString = self->_mainDictionary[@"data"][0][@"sunrise"];
    self->_sunsetString = self->_mainDictionary[@"data"][0][@"sunset"];
    self->_humidityString  = self->_mainDictionary[@"data"][0][@"humidity"];
    self->_air_levelString = self->_mainDictionary[@"data"][0][@"air_level"];
    self->_visibilityString = self->_mainDictionary[@"data"][0][@"visibility"];
    self->_pressureString = self->_mainDictionary[@"data"][0][@"pressure"];*/
    if (indexPath.row == 0) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"000"];
            cell.cityLabel.text = self.nameString;
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
            WhetherTableViewCell*  cell = [self.tableView dequeueReusableCellWithIdentifier:@"111" ];
            self.scrollView = [[UIScrollView alloc] init];
            self.scrollView.frame  = CGRectMake(0, 0, 393, 150);
            self.scrollView.scrollEnabled = YES;
            //self.timearray = [[NSMutableArray alloc] init];
            //NSLog(@"111%@", self.timearray);
            self.scrollView.contentSize = CGSizeMake(98.25 * self.timeArray.count, 150);
            [cell.contentView addSubview:self.scrollView];
            for (int i = 0; i < self.timeArray.count; i++) {
                
                UILabel *label = [[UILabel alloc] init];
                label.frame = CGRectMake(20 + 98.5 * i, 10, 20, 20);
                [self.scrollView addSubview:label];
                label.text = self.timeArray[i];
                label.textColor = [UIColor whiteColor];
                
                UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", self.wea_img0Array[i]]]];
                imageView.frame = CGRectMake(20 + 98.5 * i, 55, 40, 40);
                [self.scrollView addSubview:imageView];
                
                UILabel *label1 = [[UILabel alloc] init];
                label1.frame = CGRectMake(20 + 98.5 * i, 110, 20, 20);
                [self.scrollView addSubview:label1];
                label1.text = self.hourTemArray[i];
                label1.textColor = [UIColor whiteColor];}
            
               /*self.scrollView = [[UIScrollView alloc] init];
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
            }*/
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        } else if (indexPath.row >= 2 && indexPath.row <= 7){
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"222" ];
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
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"333"];
            cell.air_tipsLabel.text = self.air_tipsString;
            cell.air_tipsLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        } else if (indexPath.row == 9) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"444"];
            cell.sunriseLabel.text = self.sunriseString;
            cell.sunriseLabel.textColor = [UIColor whiteColor];
            cell.sunsetLabel.text = self.sunsetString;
            cell.sunsetLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        }else if (indexPath.row == 10) {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"555"];
            cell.humidityLabel.text  = self.humidityString;
            cell.humidityLabel.textColor = [UIColor whiteColor];
            cell.air_levelLabel.text = self.air_levelString;
            cell.air_levelLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        } else {
            WhetherTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"666"];
            cell.visibilityLabel.text = self.visibilityString;
            cell.visibilityLabel.textColor = [UIColor whiteColor];
            cell.pressureLabel.text = self.pressureString;
            cell.pressureLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor  = [UIColor clearColor];
            return cell;
        }
}
/*- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int i = self.scrollView.contentOffset.x / 393;
    self.mainDictionary = self.dictionaryArray[i];
    self.nameString = self.mainDictionary[@"city"];
    NSLog(@"%@", self.nameString);
    self.wheString  = self.mainDictionary[@"data"][0][@"wea"];
    self.temString  = self.mainDictionary[@"data"][0][@"tem"];
    self.dayString = self.mainDictionary[@"data"][0][@"week"];
    self.highTemString = self.mainDictionary[@"data"][0][@"tem1"];
    self.lowTemstring = self.mainDictionary[@"data"][0][@"tem2"];
    
    self.timeArray = [[NSMutableArray alloc] init];
    self.timeArray = self.mainDictionary[@"data"][0][@"hours"];
    self.timeArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < self->timeArray.count; j++) {
        [self.timeArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"hours"]];
        //NSLog(@"%@", self.timeArray[i]);
    }
    self.wea_img0Array = [[NSMutableArray alloc] init];
    for (int j = 0; j < self->timeArray.count; j++) {
        [self.wea_img0Array addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"wea_img"]];
    }
    self.hourTemArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < self->timeArray.count; j++) {
        [self.hourTemArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"tem"]];
    }
    
    NSMutableArray* array = self->_mainDictionary[@"data"];
    self.dayArray = [[NSMutableArray array] init];
    for (int j = 1; j < array.count; j++) {
        [self.dayArray addObject:self.mainDictionary[@"data"][j][@"week"]];
    }
    self.wea_imgArary = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_wea_imgArary addObject:self->_mainDictionary[@"data"][j][@"wea_img"]];
    }
    self.tem1Array = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_tem1Array addObject:self->_mainDictionary[@"data"][j][@"tem1"]];
    }
    self.tem2Array = [[NSMutableArray alloc] init];
    for (int j = 1; j < array.count; j++) {
        [self->_tem2Array addObject:self->_mainDictionary[@"data"][j][@"tem2"]];
    }
    self->_air_tipsString = self->_mainDictionary[@"data"][0][@"air_tips"];
    self->_sunriseString = self->_mainDictionary[@"data"][0][@"sunrise"];
    self->_sunsetString = self->_mainDictionary[@"data"][0][@"sunset"];
    self->_humidityString  = self->_mainDictionary[@"data"][0][@"humidity"];
    self->_air_levelString = self->_mainDictionary[@"data"][0][@"air_level"];
    self->_visibilityString = self->_mainDictionary[@"data"][0][@"visibility"];
    self->_pressureString = self->_mainDictionary[@"data"][0][@"pressure"];
   self.tableView.frame = CGRectMake(393 * i, 0, 393, self.view.bounds.size.height);
    [self.tableView reloadData];

}*/

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//            int i = self.scrollView.contentOffset.x / 393;
//            self.mainDictionary = self.dictionaryArray[i];
//            self.nameString = self.mainDictionary[@"city"];
//            NSLog(@"%@", self.nameString);
//            self.wheString  = self.mainDictionary[@"data"][0][@"wea"];
//            self.temString  = self.mainDictionary[@"data"][0][@"tem"];
//            self.dayString = self.mainDictionary[@"data"][0][@"week"];
//            self.highTemString = self.mainDictionary[@"data"][0][@"tem1"];
//            self.lowTemstring = self.mainDictionary[@"data"][0][@"tem2"];
//            
//            self.timeArray = [[NSMutableArray alloc] init];
//            self.timeArray = self.mainDictionary[@"data"][0][@"hours"];
//            self.timeArray = [[NSMutableArray alloc] init];
//            for (int j = 0; j < self->timeArray.count; j++) {
//                [self.timeArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"hours"]];
//                //NSLog(@"%@", self.timeArray[i]);
//            }
//            self.wea_img0Array = [[NSMutableArray alloc] init];
//            for (int j = 0; j < self->timeArray.count; j++) {
//                [self.wea_img0Array addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"wea_img"]];
//            }
//            self.hourTemArray = [[NSMutableArray alloc] init];
//            for (int j = 0; j < self->timeArray.count; j++) {
//                [self.hourTemArray addObject:self.mainDictionary[@"data"][0][@"hours"][j][@"tem"]];
//            }
//            
//            NSMutableArray* array = self->_mainDictionary[@"data"];
//            self.dayArray = [[NSMutableArray array] init];
//            for (int j = 1; j < array.count; j++) {
//                [self.dayArray addObject:self.mainDictionary[@"data"][j][@"week"]];
//            }
//            self.wea_imgArary = [[NSMutableArray alloc] init];
//            for (int j = 1; j < array.count; j++) {
//                [self->_wea_imgArary addObject:self->_mainDictionary[@"data"][j][@"wea_img"]];
//            }
//            self.tem1Array = [[NSMutableArray alloc] init];
//            for (int j = 1; j < array.count; j++) {
//                [self->_tem1Array addObject:self->_mainDictionary[@"data"][j][@"tem1"]];
//            }
//            self.tem2Array = [[NSMutableArray alloc] init];
//            for (int j = 1; j < array.count; j++) {
//                [self->_tem2Array addObject:self->_mainDictionary[@"data"][j][@"tem2"]];
//            }
//            self->_air_tipsString = self->_mainDictionary[@"data"][0][@"air_tips"];
//            self->_sunriseString = self->_mainDictionary[@"data"][0][@"sunrise"];
//            self->_sunsetString = self->_mainDictionary[@"data"][0][@"sunset"];
//            self->_humidityString  = self->_mainDictionary[@"data"][0][@"humidity"];
//            self->_air_levelString = self->_mainDictionary[@"data"][0][@"air_level"];
//            self->_visibilityString = self->_mainDictionary[@"data"][0][@"visibility"];
//            self->_pressureString = self->_mainDictionary[@"data"][0][@"pressure"];
//            self.tableView.frame = CGRectMake(393 * i, 0, 393, self.view.bounds.size.height);
//            [self.tableView reloadData];
//    
//}
///*- (void)createUrl:(int)i :(UITableView*)tableView{
//    NSString *urlString = [NSString stringWithFormat:@"https://v0.yiketianqi.com/api?unescape=1&version=v9&appid=81453197&appsecret=1LT6V1Da&city=%@", self.passCityNamearray[i]];
//        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//        NSURL *url = [NSURL URLWithString:urlString];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        NSURLSession *sharedSession = [NSURLSession sharedSession];
//        NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
//            if(data) {
//                self->_mainDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//                self->_nameString = self->_mainDictionary[@"city"];
//                NSLog(@"%@", self.nameString);
//                self->_wheString  = self->_mainDictionary[@"data"][0][@"wea"];
//                self->_temString  = self->_mainDictionary[@"data"][0][@"tem"];
//                self->_dayString = self->_mainDictionary[@"data"][0][@"week"];
//                self->_highTemString = self->_mainDictionary[@"data"][0][@"tem1"];
//                self->_lowTemstring = self->_mainDictionary[@"data"][0][@"tem2"];
//                
//                self->timeArray = [[NSMutableArray alloc] init];
//                self->timeArray = self->_mainDictionary[@"data"][0][@"hours"];
//                self->timeArray = [[NSMutableArray alloc] init];
//                for (int i = 0; i < self->timeArray.count; i++) {
//                    [self->timeArray addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"hours"]];
//                    //NSLog(@"%@", self.timeArray[i]);
//                }
//                self.wea_img0Array = [[NSMutableArray alloc] init];
//                for (int i = 0; i < self->timeArray.count; i++) {
//                    [self->_wea_img0Array addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"wea_img"]];
//                }
//                self.hourTemArray = [[NSMutableArray alloc] init];
//                for (int i = 0; i < self->timeArray.count; i++) {
//                    [self->_hourTemArray addObject:self->_mainDictionary[@"data"][0][@"hours"][i][@"tem"]];
//                }
//                
//                NSMutableArray* array = self->_mainDictionary[@"data"];
//                self->_dayArray = [[NSMutableArray array] init];
//                for (int i = 1; i < array.count; i++) {
//                    [self->_dayArray addObject:self->_mainDictionary[@"data"][i][@"week"]];
//                }
//                self.wea_imgArary = [[NSMutableArray alloc] init];
//                for (int i = 1; i < array.count; i++) {
//                    [self->_wea_imgArary addObject:self->_mainDictionary[@"data"][i][@"wea_img"]];
//                }
//                self.tem1Array = [[NSMutableArray alloc] init];
//                for (int i = 1; i < array.count; i++) {
//                    [self->_tem1Array addObject:self->_mainDictionary[@"data"][i][@"tem1"]];
//                }
//                self.tem2Array = [[NSMutableArray alloc] init];
//                for (int i = 1; i < array.count; i++) {
//                    [self->_tem2Array addObject:self->_mainDictionary[@"data"][i][@"tem2"]];
//                }
//                self->_air_tipsString = self->_mainDictionary[@"data"][0][@"air_tips"];
//                self->_sunriseString = self->_mainDictionary[@"data"][0][@"sunrise"];
//                self->_sunsetString = self->_mainDictionary[@"data"][0][@"sunset"];
//                self->_humidityString  = self->_mainDictionary[@"data"][0][@"humidity"];
//                self->_air_levelString = self->_mainDictionary[@"data"][0][@"air_level"];
//                self->_visibilityString = self->_mainDictionary[@"data"][0][@"visibility"];
//                self->_pressureString = self->_mainDictionary[@"data"][0][@"pressure"];
//                
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    NSLog(@"111");
//                    NSLog(@"%d", i);
//                        self->_tableView = [[UITableView alloc] initWithFrame:CGRectMake(393 * i, 0, 393, self.view.bounds.size.height) style:UITableViewStyleGrouped];
//                        //self.tableView.backgroundView  = [[UIImageView init] initWithImage:[UIImage imageNamed:@"image1"]];
//                        //self.tableView.backgroundColor = [UIColor systemBlueColor];
//                        self->_tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
//                        self->_tableView.delegate = self;
//                        self->_tableView.dataSource = self;
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"000"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"111"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"222"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"333"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"444"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"555"];
//                        [self->_tableView registerClass:[WhetherTableViewCell class] forCellReuseIdentifier:@"666"];
//                                //NSLog(@"%@", self.cityName);
//                         
//                        [self->_scrollView addSubview:self->_tableView];
//                        [self->_tableView reloadData];
//                         
//                    // [self.scrollView addSubview:self.tableView];
//                    
//                }];
//            }
//        }];
//        [dataTask resume];
//}*/
- (void)pressLeft {
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
