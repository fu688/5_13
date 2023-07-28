//
//  PictureViewController.m
//  SHARE
//
//  Created by 付闯 on 2023/7/26.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"选择图片";
    UIBarButtonItem* btnNext1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ffanhui-"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = btnNext1;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem* btnNext2 = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = btnNext2;
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    for (int i = 0; i <= 6; i++) {
        NSString* strName = [NSString stringWithFormat:@"pic_%d", i + 1];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* view = [[UIImageView alloc] initWithImage:image];
        view.frame = CGRectMake(0 + (i % 3) * 132 , 110 + (i / 3)* 132, 127, 127);
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [view addGestureRecognizer:tap];
        view.tag = 101 + i;
        [self.view addSubview:view];
    }
    self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定上传已选择的照片" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    [self.alert addAction:action];
    [self.alert addAction:action1];
    self.array = [NSMutableArray array];
    
}
- (void) pressTap:(UIGestureRecognizer*) tap {
    self.imageView = (UIImageView*) tap.view;
    for (int i = 0; i < self.array1.count; i++) {
        if ([self.array1[i] isEqual:self.imageView.image]) {
            return;
        }
    }
    [self.array addObject:self.imageView.image];
    //[self.delegate passImageView:self.imageView.image];
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"choose"]];
    self.imageView1.frame = CGRectMake(107, 0, 20, 20);
    [self.imageView addSubview:self.imageView1];
}
- (void) pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) pressRight {
    /*self.alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否确定上传已选择的照片" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    [self.alert addAction:action];
    [self.alert addAction:action1];*/
    [self.delegate passImage:self.array];
    self.alert = [UIAlertController alertControllerWithTitle:@"操作完成" message:@"上传成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    [self.alert addAction:action];
    [self presentViewController:self.alert animated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popoverPresentationController];
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
