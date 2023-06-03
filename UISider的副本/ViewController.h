//
//  ViewController.h
//  UISider
//
//  Created by 付闯 on 2023/5/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //进度条对象
    //表示下载或视频播放的进度
    UIProgressView* _progressView;
    //划动条的定义
    //进行调整音乐的音量
    UISlider* _slider;
}
@property (retain, nonatomic) UIProgressView* progressView;
@property (retain, nonatomic) UISlider* slider;
@end

