//
//  VCSecend.m
//  项目1
//
//  Created by 付闯 on 2023/7/14.
//

#import "VCSecend.h"

@interface VCSecend ()

@end

@implementation VCSecend

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.segControl = [[UISegmentedControl alloc] init];
    self.segControl.frame = CGRectMake(20, 50, 350, 50);
    [self.segControl insertSegmentWithTitle:@"one" atIndex:0 animated:NO];
    [self.segControl insertSegmentWithTitle:@"two" atIndex:1 animated:NO];
    [self.segControl insertSegmentWithTitle:@"three" atIndex:2 animated:NO];
    [self.segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    _segControl.selectedSegmentIndex = 0;
    [self.view addSubview:self.segControl];
    self.sv = [[UIScrollView alloc] init];
    self.sv.frame  = CGRectMake(20, 100, 350, 700);
    self.sv.pagingEnabled = YES;
    self.sv.scrollEnabled = YES;
    self.sv.contentSize = CGSizeMake(350 * 3, 700);
    for (int i = 0; i < 3; i++) {
        NSString* strName = [NSString stringWithFormat:@"*%d.jpg", i + 2];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* view = [[UIImageView alloc] initWithImage:image];
        view.frame = CGRectMake(350 * i, 0, 350, 700);
        [_sv addSubview:view];
    }
    [self.view addSubview:self.sv];
    self.sv.delegate = self;
    
}
- (void)segChange {
    if (self.segControl.selectedSegmentIndex == 0) {
        self.sv.contentOffset = CGPointMake(0, 0);
    }
    if (self.segControl.selectedSegmentIndex == 1) {
        self.sv.contentOffset = CGPointMake(350, 0);
    }
    if (self.segControl.selectedSegmentIndex == 2) {
        self.sv.contentOffset = CGPointMake(700, 0);
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.sv.contentOffset.x >=0 && self.sv.contentOffset.x <= 175) {
        self.segControl.selectedSegmentIndex = 0;
    }
    if (self.sv.contentOffset.x > 175 && self.sv.contentOffset.x <= 525) {
        self.segControl.selectedSegmentIndex = 1;
    }
    if (self.sv.contentOffset.x > 525 && self.sv.contentOffset.x <= 875) {
        self.segControl.selectedSegmentIndex = 2;
    }
    
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
