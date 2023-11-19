//
//  CalculationModel.h
//  简易计算器1.0
//
//  Created by 付闯 on 2023/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculationModel : NSObject
@property (nonatomic) NSMutableString* showString;
@property (nonatomic) NSMutableArray* charArray;
- (void)calculationArrayInit;
@end

NS_ASSUME_NONNULL_END
