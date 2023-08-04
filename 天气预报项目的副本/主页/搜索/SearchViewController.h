//
//  SearchViewController.h
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLSessionDelegate>
{
    UITextField* textField;
    NSMutableArray* cityArray;
    NSMutableArray* timeArray;
    NSMutableData* data1;
}
@property (nonatomic, strong) NSMutableArray* cityPassArray;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSDictionary* mainDictionary;
@property NSString* str;
@property NSString* nameString;
@end

NS_ASSUME_NONNULL_END
