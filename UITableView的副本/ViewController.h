//
//  ViewController.h
//  UITableView
//
//  Created by 付闯 on 2023/5/31.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//实现数据视图的普通协议
//数据视图的普通事件chuli
UITableViewDelegate,
//实现数据视图的数据代理协议
//处理数据视图的数据代理
UITableViewDataSource
>
{
    //定义一个数据视图对象
    //显示大量相同格式的信息的视图
    //例如电话通讯录，QQ好友，朋友圈信息
    UITableView* _tableView;
}
@end

