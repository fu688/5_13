//
//  LoginViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<RegisterViewDelegate>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIImageView* imageView1;
@property (nonatomic, strong) UITextField* textFiled;
@property (nonatomic, strong) UITextField* textFiled1;
@property (nonatomic, strong) UIImageView* imageView2;
@property (nonatomic, strong) UIImageView* imageView3;
@property (nonatomic, strong) UIButton* btn;
@property (nonatomic, strong) UIButton* btn1;
@property (nonatomic, strong) NSMutableArray* array1;
@property (nonatomic, strong) NSMutableArray* array2;
@property (nonatomic, strong) UIAlertController* alert;
@property (nonatomic, strong) UILabel* label;

@end

NS_ASSUME_NONNULL_END
