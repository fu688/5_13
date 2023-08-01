//
//  RegisterViewController.h
//  SHARE
//
//  Created by 付闯 on 2023/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol RegisterViewDelegate <NSObject>

- (void) registerReturn:(NSString*) namestr andPass: (NSString*) passStr;

@end

@interface RegisterViewController : UIViewController
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIImageView* imageView1;
@property (nonatomic, strong) UITextField* textFiled;
@property (nonatomic, strong) UITextField* textFiled1;
@property (nonatomic, strong) UITextField* textFiled2;
@property (nonatomic, strong) UIImageView* imageView2;
@property (nonatomic, strong) UIImageView* imageView3;
@property (nonatomic, strong) UIImageView* imageView4;
@property (nonatomic, strong) UIButton* btn;
@property (nonatomic, strong) UIAlertController* alert;
@property (nonatomic, strong) UIAlertController* alert1;
@property (nonatomic, assign) id<RegisterViewDelegate> delegate;
@property (nonatomic, strong) UILabel* label;
@property NSMutableArray* array1;
@property NSMutableArray* array2;
@end

NS_ASSUME_NONNULL_END
