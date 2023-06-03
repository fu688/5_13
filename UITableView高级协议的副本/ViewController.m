//
//  ViewController.m
//  UITableView高级协议
//
//  Created by 付闯 on 2023/6/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //自动调整子视图的大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //数据视图1的头尾部视图的设定
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    [self.view addSubview: _tableView];
    //初始化数据源数组
    _arraydata = [[NSMutableArray alloc] init];
    for (int i = 1; i < 20; i++) {
        NSString* str = [NSString stringWithFormat:@"A%d", i];
        [_arraydata addObject:str];
    }
    //当前数据的数据源发生变化时
    //更新数据视图，重新加载数据
    [_tableView reloadData];
    [self creatBtn];
}
- (void) creatBtn {
    _isEdit = NO;
    //创建功能按钮
    _btnEdit = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnDelete = [[UIBarButtonItem alloc] initWithTitle:@"删除 " style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    _btnFinish = [[UIBarButtonItem alloc] initWithTitle:@"完成"style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    self.navigationItem.rightBarButtonItem = _btnEdit;
}
//选中单元格调用此函数
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中单元格%ld, %ld", indexPath.section, indexPath.row);
}
//取消选中时调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中单元格%ld %ld", indexPath.section, indexPath.row);
}
//可以显示编辑状态，当手指在单元格上移动时
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_arraydata removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    NSLog(@"delete");
}
//单元格显示效果协议
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    //默认为删除
    //UITableViewCellEditingStyleInsert
    //UITableViewCellEditingStyleNone
    return  UITableViewCellEditingStyleDelete |UITableViewCellEditingStyleInsert;
}
- (void)pressEdit {
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _btnFinish;
    [_tableView setEditing:YES];
    self.navigationItem.leftBarButtonItem = _btnDelete;
}
- (void)pressFinish {
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _btnEdit;
    [_tableView setEditing:NO];
    self.navigationItem.leftBarButtonItem = nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arraydata.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* strID = @"ID";
    //尝试获取可以复用的单元格
    //如果得不到，返回nil
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:strID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    //单元格文字赋值
    cell.textLabel.text = [_arraydata objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"子标题";
    NSString* str = [NSString stringWithFormat:@"%ld+.jpg", indexPath.row % 4 + 1];
    UIImage* image = [UIImage imageNamed:str];
    //设置默认图标信息
    cell.imageView.image = image;
    return cell;
}
@end
