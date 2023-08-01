//
//  LoginViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/28.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<RegisterViewDelegate>
@property UITextField* textFieldAccount;
@property UITextField* textFieldPassword;
@property UIImageView* imageViewAccount;
@property UIImageView* imageViewPassword;
@property UIButton* btnLogin;
@property UIButton* btnRegister;
@property NSMutableArray* arrayAccount;
@property NSMutableArray* arrayPassword;
@property UIAlertController* alert;
@end

NS_ASSUME_NONNULL_END
