//
//  ViewController.m
//  UITableView
//
//  Created by 付闯 on 2023/5/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建数据视图
    //p1数据视图的位置
    //p2数据视图的风格
    //UITableViewStylePlain 普通风格
    //UITableViewStyleGrouped分组风格
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //设置数据视图的代理对象
    _tableView.delegate = self;
    //设置数据视图的数据源对象
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
//获取每组元素的个数
//必须要实现的协议函数
//程序在显示数据视图时会调用此函数
//返回值：每组元素的个数
//p1数据视图对象本身
//p2哪一组需要的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//设置数据视图的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//创建单元格函数
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellStr = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        //创建一个单元格对象
        //p1单元格的样式
        //p2单元格的复用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSString* str = [NSString stringWithFormat:@"第%ld组，第%ld行", indexPath.section, indexPath.row];
    //将单元格的主文字内容赋值
    cell.textLabel.text = str;
    return cell;
}
@end
