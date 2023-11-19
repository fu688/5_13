//
//  ReviewsControllerViewController.h
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import <UIKit/UIKit.h>
#import "ReviewsView.h"
#import "ReviewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ReviewsControllerViewController : UIViewController
@property NSString* id;
@property (nonatomic, strong) NSDictionary* shortReviewsDictionary;
@property (nonatomic, strong) NSDictionary* LongReviewsDictionary;
@property ReviewsView* reviewView;
@property ReviewsModel* model;
@end

NS_ASSUME_NONNULL_END
