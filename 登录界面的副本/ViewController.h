//
//  ViewController.h
//  登录界面
//
//  Created by 付闯 on 2023/5/25.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //用户名提示Label
    UILabel* _lbUserName;
    //密码提示Label
    UILabel* _lbPassword;
    //用户名输入框
    UITextField* _tfUserName;
    //密码输入框
    UITextField* _tfPassword;
    //登录时按钮
    UIButton* _btLogin;
    //注册按钮
    UIButton* _btRegister;
}

@end

