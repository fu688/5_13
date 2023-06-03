//
//  ViewController.h
//  定时器和视图移动
//
//  Created by 付闯 on 2023/5/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义一个定时器对象
    NSTimer* _timerView;
}
//定义属性
@property (retain, nonatomic) NSTimer* timer;

@end

