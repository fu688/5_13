//
//  OpenView.m
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import "OpenViewController.h"

@interface OpenViewController ()

@end

@implementation OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_1"]];
    self.imageView.frame = self.view.bounds;
    [self.view addSubview:self.imageView];
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
