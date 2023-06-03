//
//  ViewController.h
//  步进器和分栏控件
//
//  Created by 付闯 on 2023/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义步进器对象
    //按照一定的数字来调整某个数据
    UIStepper* _stepper;
    //分栏控制器
    UISegmentedControl* _segControl;
}
@property (retain, nonatomic) UIStepper* stepper;
@property (retain, nonatomic) UISegmentedControl* segControl;
@end

