//
//  VCFirst.h
//  多界面传值
//
//  Created by 付闯 on 2023/5/31.
//

#import <UIKit/UIKit.h>
#import "VCSecend.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCFirst : UIViewController<VCSecendDelegate>
- (void)changeColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
