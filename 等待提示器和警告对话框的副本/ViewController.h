//
//  ViewController.h
//  等待提示器和警告对话框
//
//  Created by 付闯 on 2023/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义一个警告对话框视图对象
    UIAlertController* _alert;
    //等待提示对象
    //当下载或加载较大文件时，可以显示此控件，处于提示等待状态
    UIActivityIndicatorView* _activityIndicator;
}
@property (retain, nonatomic) UIAlertController* alert;
@property (retain, nonatomic) UIActivityIndicatorView* activityIndicator;
@end

