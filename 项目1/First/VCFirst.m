
//  VCFirst.m
//  项目1
//
//  Created by 付闯 on 2023/7/14.
//

#import "VCFirst.h"

@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.sv = [[UIScrollView alloc] init];
    self.sv.frame  = CGRectMake(20, 300, 350, 450);
    self.sv.pagingEnabled = YES;
    self.sv.scrollEnabled = YES;
    self.sv.contentSize = CGSizeMake(350 * 6, 450);
    for (int i = 0; i < 5; i++) {
        NSString* strName = [NSString stringWithFormat:@"*%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* view = [[UIImageView alloc] initWithImage:image];
        view.frame = CGRectMake(350 * i, 0, 350, 450);
        [_sv addSubview:view];
    }
    NSString* strName = [NSString stringWithFormat:@"*2.jpg"];
    UIImage* image = [UIImage imageNamed:strName];
    UIImageView* view = [[UIImageView alloc] initWithImage:image];
    view.frame = CGRectMake(350 * 5, 0, 350, 450);
    [_sv addSubview:view];

    UIImage* image1 = [UIImage imageNamed:@"1689579790955.png"];
    UIImageView* view1 = [[UIImageView alloc] initWithImage:image1];
    view1.frame = CGRectMake(20, 50, 350, 200);
    self.sv.contentOffset = CGPointMake(350, 0);
    [self.view addSubview:self.sv];
    self.sv.delegate = self;
    [self.view addSubview:view1];
    UIButton* btnleft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnleft.frame = CGRectMake(0, 500, 20, 20);
    [btnleft setTitle:@"<" forState:UIControlStateNormal];
    [btnleft setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btnleft.titleLabel.font = [UIFont systemFontOfSize:30];
    [btnleft addTarget:self action:@selector(pressLeft) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnleft];
    UIButton* btnRight  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRight.frame = CGRectMake(370, 500, 20, 20);
    [btnRight setTitle:@">" forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:30];
    [btnRight addTarget:self action:@selector(pressRight) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRight];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.sv.contentOffset.x == 350 * 5) {
        self.sv.contentOffset = CGPointMake(350 * 1, 0);
    }
    if (self.sv.contentOffset.x == 0) {
        self.sv.contentOffset = CGPointMake(350 * 4, 0);
    }
}
- (void)pressLeft {
    int num = _sv.contentOffset.x / 350;
    [_sv setContentOffset:CGPointMake(350 * (num - 1), 0) animated:YES];
    if (num == 1) {
        _sv.contentOffset = CGPointMake(350 * 4, 0);
    }
       
        
}
- (void)pressRight {
    int num = _sv.contentOffset.x / 350;
    _sv.contentOffset = CGPointMake(350 * (num + 1), 0);
    if (num == 4) {
        _sv.contentOffset = CGPointMake(350 * 1, 0);
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
