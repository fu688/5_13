//
//  ViewController.m
//  定时器。。
//
//  Created by 付闯 on 2023/5/15.
//

#import "ViewController.h"
#import "Timer.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Timer* mytimer = [[Timer alloc] init];
            NSRunLoop *loop = [NSRunLoop currentRunLoop];
            [loop run];
    // Do any additional setup after loading the view.
}


@end
