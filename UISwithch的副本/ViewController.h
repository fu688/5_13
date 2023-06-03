//
//  ViewController.h
//  UISwithch
//
//  Created by 付闯 on 2023/5/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义一个开关控件
    //可以进行两种状态改变
    //所有UIKit框架库中的控件均以UI开头
    UISwitch* _mySwitch;
}
@property (nonatomic, retain)UISwitch* mySwithch;
@end

