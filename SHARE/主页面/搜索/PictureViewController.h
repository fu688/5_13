//
//  PictureViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol passDelegate <NSObject>

- (void)passImage:(NSMutableArray*)array;

@end
@interface PictureViewController : UIViewController
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIImageView* imageView1;
@property (nonatomic, strong) UIAlertController* alert;
@property (nonatomic, assign) id<passDelegate> delegate;
@property (nonatomic, strong) NSMutableArray* array;
@property (nonatomic, strong) NSMutableArray* array1;
@end

NS_ASSUME_NONNULL_END
