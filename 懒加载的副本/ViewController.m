//
//  ViewController.m
//  懒加载
//
//  Created by 付闯 on 2023/6/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Label];
}
- (UILabel*)Label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(50, 50, 100, 100);
        _label.text = @"688";
        [self.view addSubview:_label];
    }
    return _label;
}

@end
