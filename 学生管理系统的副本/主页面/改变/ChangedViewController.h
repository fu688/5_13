//
//  ChangedViewController.h
//  学生管理系统
//
//  Created by 付闯 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol returnDelegate3 <NSObject>

- (void)returnName:(NSString*)name andClass:(NSString*)class andScore:(NSString*)score;

@end
@interface ChangedViewController : UIViewController
@property NSMutableArray* arrayscoreAdd;
@property UITextField* textFieldName;
@property UITextField* textFieldClass;
@property UITextField* textFieldScore;
@property UIImageView* imageViewName;
@property UIImageView* imageViewClass;
@property UIImageView* imageViewScore;
@property UIButton* btnFinish;
@property UIButton* btnReturn;
@property UIAlertController* alert;
@property NSString* str;
@property id<returnDelegate3> delegate3;
@end

NS_ASSUME_NONNULL_END
