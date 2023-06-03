//
//  ViewController.h
//  UIScrollView高级
//
//  Created by 付闯 on 2023/5/27.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
//当前视图控制器要实现协议UIScrollView函数
{
    //定义一个滚动视图成员变量
    UIScrollView* _scrollView;
}

@end

