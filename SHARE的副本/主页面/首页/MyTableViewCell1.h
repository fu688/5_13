//
//  MyTableViewCell1.h
//  SHARE
//
//  Created by 付闯 on 2023/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell1 : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView* imageView0;
@property (nonatomic, strong) UIImageView* imageView1;
@property (nonatomic, strong) UIScrollView* sv;
@property (nonatomic, strong) NSTimer* mytimer;
@property (nonatomic,strong) UILabel* label;
@property (nonatomic, strong) UILabel* label1;
@property (nonatomic,strong) UILabel* label2;
@property (nonatomic, strong) UILabel* label3;
@property (nonatomic, strong) UILabel* label4;
@property (nonatomic,strong) UILabel* label5;
@property (nonatomic, strong) UILabel* label6;
@property (nonatomic , strong) UIButton* btn;
@property (nonatomic, strong) UIImageView* imageView2;
@property (nonatomic, strong) NSString* str;
@end

NS_ASSUME_NONNULL_END
