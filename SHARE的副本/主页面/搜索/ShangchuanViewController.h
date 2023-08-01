//
//  ShangchuanViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/25.
//

#import <UIKit/UIKit.h>
#import "PictureViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShangchuanViewController : UIViewController<passDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton* btn;
@property (nonatomic, strong) UIButton* btn1;
@property (nonatomic, strong) UIButton* btn2;
@property (nonatomic, strong) UIButton* btn3;
@property (nonatomic, strong) UIButton* btn4;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) NSArray* array;
@property (nonatomic, strong) UITextField* textFiled;
@property (nonatomic, strong) UITextField* textFiled1;
@property (nonatomic, strong) NSMutableArray* array1;
@property (nonatomic, strong) UIImageView* imageView1;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIButton* btn5;
@property (nonatomic, strong) NSMutableArray* array2;
@property (nonatomic, strong) UILabel* label1;
@property (nonatomic, strong) UIView* view1;
@property NSInteger i;
@end

NS_ASSUME_NONNULL_END
