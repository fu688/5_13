//
//  VCSecend.h
//  项目1
//
//  Created by 付闯 on 2023/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCSecend : UIViewController<UIScrollViewDelegate>
@property (retain , nonatomic) UISegmentedControl* segControl;
@property (nonatomic, strong) UIScrollView* sv;
@end

NS_ASSUME_NONNULL_END
