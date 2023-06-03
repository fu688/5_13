//
//  superView.h
//  手动布局子视图
//
//  Created by 付闯 on 2023/5/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface superView : UIView
{
    UIView* _view01;
    UIView* _view02;
    UIView* _view03;
    UIView* _view04;
}
- (void) createSubViews;
@end

NS_ASSUME_NONNULL_END
