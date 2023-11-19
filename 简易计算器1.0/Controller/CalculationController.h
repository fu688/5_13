//
//  ViewController.h
//  简易计算器1.0
//
//  Created by 付闯 on 2023/9/27.
//

#import <UIKit/UIKit.h>
#import "CalculationView.h"
#import "CalculationModel.h"
@interface CalculationController : UIViewController
@property (nonatomic, strong) CalculationView* calculationView;
@property (nonatomic, strong) CalculationModel* calculationModel;

- (NSString*)calclation:(NSMutableArray*) changeArray;
- (NSInteger)jugdeError:(NSMutableArray*) charArray andString:(NSMutableString*) string;
- (NSInteger)judgePut:(NSString*) string andcharArray: (NSMutableArray*)charArray;
- (NSInteger)judgePoint:(NSString*) string andcharArray: (NSMutableArray*)charArray;
@end

