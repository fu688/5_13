//
//  ContentsViewController.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/15.
//

#import <UIKit/UIKit.h>
#import "ContentsView.h"
#import "ContentsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContentsViewController : UIViewController
@property (nonatomic, strong)ContentsModel* contentsModel;
@property (nonatomic, strong)ContentsView* contentsView;
@property (nonatomic, strong) NSDictionary* dictionary;

- (void)addUI;
@end

NS_ASSUME_NONNULL_END
