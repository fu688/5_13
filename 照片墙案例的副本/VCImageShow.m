//
//  VCImageShow.m
//  照片墙案例
//
//  Created by 付闯 on 2023/5/31.
//

#import "VCImageShow.h"

@interface VCImageShow ()

@end

@implementation VCImageShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"视图展示";
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(0, 0, 320, 480);
    //_imageView.image = _image;
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"_%d.jpg", _imageTag - 100]];
    //一个视图对象只有一个根试图
    //添加到新的父类时，会从原来的父亲视图中删除
    [self.view addSubview:_imageView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
