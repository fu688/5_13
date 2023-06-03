//
//  ViewController.m
//  UIlabel
//
//  Created by 付闯 on 2023/5/21.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController
- (void) creatUI {
    UILabel* label = [[UILabel alloc] init];
    //对象为字符串
    label.text = @"fuchung";
    label.frame = CGRectMake(100, 100, 160, 40);
    label.textColor = [UIColor purpleColor];
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    //默认字体大小为12
    label.font = [UIFont systemFontOfSize:20];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(5, 5);
    //文字的对齐
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}


@end
