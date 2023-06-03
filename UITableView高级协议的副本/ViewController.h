//
//  ViewController.h
//  UITableView高级协议
//
//  Created by 付闯 on 2023/6/1.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView* _tableView;
    //数据源对象
    NSMutableArray* _arraydata;
    
    //添加导航栏按钮
    UIBarButtonItem* _btnEdit;
    UIBarButtonItem* _btnFinish;
    UIBarButtonItem* _btnDelete;
    //设置编辑状态
    BOOL _isEdit;
}
-(void)creatBtn;
@end

