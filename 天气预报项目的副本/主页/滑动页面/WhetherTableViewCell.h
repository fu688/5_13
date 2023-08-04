//
//  WhetherTableViewCell.h
//  天气预报项目
//
//  Created by 付闯 on 2023/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WhetherTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property UILabel* cityLabel;;
@property UILabel* weaLabel;
@property UILabel* temLabel;
@property UILabel* weekLabel;
@property UILabel* hightemLabel;
@property UILabel* lowtemLabel;

@property UILabel* timeLabel;
@property UIImageView* houreWeaImageView;
@property UILabel* houretemLabel;
@property UIScrollView* scrollView;

@property NSMutableArray* timearray;
@property NSMutableArray* imageViewArray;
@property NSMutableArray* houreTemArray;

@property UILabel* weeklabel1;
@property UIImageView* dayWeaImageView;
@property UILabel* dayHightemLabel;
@property UILabel* dayLowtemLabel;

@property UILabel* air_tipsLabel;
@property UILabel* sunriseLabel;
@property UILabel* sunsetLabel;
@property UILabel* humidityLabel;
@property UILabel* air_levelLabel;
@property UILabel* visibilityLabel;
@property UILabel* pressureLabel;


@end

NS_ASSUME_NONNULL_END
