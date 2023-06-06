//
//  ViewController.h
//  自定义cell
//
//  Created by 付闯 on 2023/6/5.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;

@end

