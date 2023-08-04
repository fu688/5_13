//
//  ScrollerViewController.h
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollerViewController : UIViewController<NSURLSessionDelegate, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    NSMutableArray* timeArray;
}
@property NSMutableArray* passCityNamearray;
@property UIScrollView* scrollView;
@property (nonatomic, strong) UITableView* tableView;
// 接收返回的数据
@property (nonatomic, strong) NSMutableData* data;
@property (nonatomic, strong) NSDictionary* mainDictionary;

@property NSString* nameString;
@property NSString* wheString;
@property NSString* temString;
@property NSString* dayString;
@property NSString* highTemString;
@property NSString* lowTemstring;

@property NSMutableArray* timeArray;
@property NSMutableArray* wea_img0Array;
@property NSMutableArray* hourTemArray;

@property NSMutableArray* dayArray;
@property NSMutableArray* wea_imgArary;
@property NSMutableArray* tem1Array;
@property NSMutableArray* tem2Array;

@property NSString* air_tipsString;
@property NSString* sunriseString;
@property NSString* sunsetString;
@property NSString* humidityString;
@property NSString* air_levelString;
@property NSString* visibilityString;
@property NSString* pressureString;

@property UIImageView* backgroudImageView;
@property NSMutableArray* passCity1Array;
@property UIAlertController* alert;

@property NSMutableArray* dictionaryArray;
//@property NSDictionary* mainDictionary;
@property int j;
@end

NS_ASSUME_NONNULL_END
