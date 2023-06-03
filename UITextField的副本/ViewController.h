//
//  ViewController.h
//  UITextField
//
//  Created by 付闯 on 2023/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //文本输入区域
    //用户名，密码等需要输入文本文字的内容区域
    //只能输入单行文字，不能输入或显示多行
    UITextField* _textFiled;
}
@property (retain, nonatomic) UITextField* textFiled;
@end

