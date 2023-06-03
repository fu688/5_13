//
//  VCRoot.m
//  照片墙案例
//
//  Created by 付闯 on 2023/5/30.
//

#import "VCRoot.h"
#import "VCImageShow.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"照片墙";
    //使导航栏不透明
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    
    UIScrollView* sv = [[UIScrollView alloc] init];
    sv.showsVerticalScrollIndicator = NO;
    //设置位置大小
    sv.frame = CGRectMake(10, 10, 300, 480);
    //设置位置大小
    sv.contentSize = CGSizeMake(300, 480* 1.5);
    //打开交互事件
    sv.userInteractionEnabled = YES;
    self.view.backgroundColor = [UIColor blackColor];
    for (int i = 0; i < 15; i++) {
        NSString* strName = [NSString stringWithFormat:@"_%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(3 + (i % 3) * 100, 10 + 140 * (i / 3), 90, 130);
        [sv addSubview:iView];
        iView.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        //单次点击
        tap.numberOfTapsRequired = 1;
        //单个手指
        tap.numberOfTouchesRequired = 1;
        [iView addGestureRecognizer:tap];
        iView.tag = i + 101;
    }
    [self.view addSubview:sv];
}
- (void)pressTap:(UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    //创建显示视图控制器
    VCImageShow* imageshow = [[VCImageShow alloc] init];
    imageshow.imageTag = imageView.tag;
    [self.navigationController pushViewController:imageshow animated:YES];
    
}
    
    /*- (void)pressTap:(UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    //创建显示视图控制器
    VCImageShow* imageshow = [[VCImageShow alloc] init];
    //点击的图像视图赋值
    imageshow.image = imageView.image;
    //将视图推入
    [self.navigationController pushViewController:imageshow animated:YES];
    NSLog(@"按钮事件触发");
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
