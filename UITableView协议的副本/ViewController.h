//
//  ViewController.h
//  UITableView协议
//
//  Created by 付闯 on 2023/6/1.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//数据代理协议
UITableViewDataSource,
//普通代理协议
UITableViewDelegate
>
{
    //创建数据视图对象
    UITableView* _tableView;
    //创建一个数据源数组
    NSMutableArray* _arraydata;
}

@end

