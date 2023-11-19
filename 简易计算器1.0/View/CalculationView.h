//
//  CalculationView.h
//  简易计算器1.0
//
//  Created by 付闯 on 2023/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculationView : UIView
@property (nonatomic) UIButton* button;

@property (nonatomic) UIButton* buttonDelete;
@property (nonatomic) UIButton* buttonLeft;
@property (nonatomic) UIButton* buttonRigth;
@property (nonatomic) UIButton* buttonDivide;
@property (nonatomic) UIButton* buttonSeven;
@property (nonatomic) UIButton* buttonEigtht;
@property (nonatomic) UIButton* buttonNine;
@property (nonatomic) UIButton* buttonMutiply;
@property (nonatomic) UIButton* buttonFour;
@property (nonatomic) UIButton* buttonFive;
@property (nonatomic) UIButton* buttonSix;
@property (nonatomic) UIButton* buttonSubtract;
@property (nonatomic) UIButton* buttonOne;
@property (nonatomic) UIButton* buttonTwo;
@property (nonatomic) UIButton* buttonThree;
@property (nonatomic) UIButton* buttonAdd;
@property (nonatomic) UIButton* buttonZero;
@property (nonatomic) UIButton* buttonPoint;
@property (nonatomic) UIButton* buttonEqual
;
@property (nonatomic) NSArray* buttonarray;

@property (nonatomic) NSMutableArray* buttonContentArray;
@property (nonatomic) UILabel* showLael;
@property (nonatomic) UILabel* showErrorLabel;
@property (nonatomic) UIButton* button1;

@end

NS_ASSUME_NONNULL_END
