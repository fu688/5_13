//
//  ViewController.m
//  UIScrollView高级
//
//  Created by 付闯 on 2023/5/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(10, 50, 300, 400);
    _scrollView.bounces = NO;
    //是否允许通过点击屏幕让滚动视图响应事件
    //_scrollView.userInteractionEnabled = NO;
    _scrollView.contentSize = CGSizeMake(300, 400*4);
    for (int i = 0; i < 4; i++) {
        //生成图片名称
        NSString* strName = [NSString stringWithFormat:@"%d+.jpg", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        //创建图像视图对象
        UIImageView* iView = [[UIImageView alloc] init];
        //图像赋值
        iView.image = image;
        //设置图像视图在滚动视图画布的位置
        iView.frame = CGRectMake(0, 400 * i, 300, 400);
        [_scrollView addSubview:iView];
    }
    [self.view addSubview: _scrollView];
    _scrollView.pagingEnabled = YES;
    
    //滚动视图画布的移动位置和偏移位置
    //功能：决定画布显示的最终图像结果
    _scrollView.contentOffset = CGPointMake(0, 400);
    //将当前视图控制器作为代理对象
    _scrollView.delegate = self;
}
//当滚动视图移动时，只要offset坐标发生变化，都会调用此函数
//参数：调用此协议的滚动视图对象
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"y = %f", scrollView.contentOffset.y);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //_scrollView.contentOffset = CGPointMake(0, 0);
    //让滚动视图移动到指定位置,动画移动
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, 300, 400) animated:YES];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Did end drag");
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"will begin drag");
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"will end drag");
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"will begin decelerrate");
}
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"视图停止移动");
}
@end
