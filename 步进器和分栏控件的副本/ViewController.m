//
//  ViewController.m
//  步进器和分栏控件
//
//  Created by 付闯 on 2023/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize stepper = _stepper;
@synthesize segControl = _segControl;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _stepper = [[UIStepper alloc] init];
    //宽高不能变
    _stepper.frame = CGRectMake(100, 100, 100, 40);
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    //设置当前值，默认值为0
    _stepper.value = 10;
    //设置步进值
    _stepper.stepValue = 1;
    //是否可以重复响应时间操作,按住重复
    _stepper.autorepeat = YES;
    //是否将步进结果通过事件函数响应出来，按住也会响应
    _stepper.continuous = YES;
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    //创建🇫🇮3控件
    _segControl = [[UISegmentedControl alloc] init];
    _segControl.frame = CGRectMake(10, 200, 300, 40);
    [_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:NO];
    [_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:NO];
    //当前默认按钮索引设置
    _segControl.selectedSegmentIndex = 0;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
    
}

- (void)stepChange {
    NSLog(@"step press value = %f", _stepper.value);
}
- (void)segChange {
    NSLog(@"%ld", _segControl.selectedSegmentIndex);
}
@end
