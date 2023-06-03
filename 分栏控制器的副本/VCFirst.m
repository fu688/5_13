//
//  VCFirst.m
//  分栏控制器
//
//  Created by 付闯 on 2023/5/30.
//

#import "VCFirst.h"

@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //UITabBarItem* tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"111" image:nil tag:101];
    //根据系统风格创建分栏按钮
    
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:101];
    //按钮右上角的提示信息
    tabBarItem.badgeValue = @"99";
    self.tabBarItem  = tabBarItem;
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
