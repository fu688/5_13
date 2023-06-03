//
//  VCImageShow.h
//  照片墙案例
//
//  Created by 付闯 on 2023/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCImageShow : UIViewController
@property (nonatomic, assign) NSUInteger* imageTag;
@property (nonatomic, retain) UIImage* image;
@property (nonatomic, retain) UIImageView* imageView;
@end

NS_ASSUME_NONNULL_END
