//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewDelegate <NSObject>

- (void) registerReturn:(NSString*) namestr andPass: (NSString*) passStr;

@end
@interface RegisterViewController : UIViewController
@property UITextField* textFieldAccount;
@property UITextField* textFieldPassword;
@property UIImageView* imageViewAccount;
@property UIImageView* imageViewPassword;
@property UIButton* btnRegister;
@property NSMutableArray* arrayAccount;
@property NSMutableArray* arrayPassword;
@property UIAlertController* alert;
@property (nonatomic, assign) id<RegisterViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
