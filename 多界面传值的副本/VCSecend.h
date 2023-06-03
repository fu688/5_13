//
//  VCSecend.h
//  多界面传值
//
//  Created by 付闯 on 2023/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VCSecendDelegate <NSObject>

//定义一个协议函数，改变背景颜色
- (void)changeColor:(UIColor*) color;

@end

@interface VCSecend : UIViewController

@property (nonatomic ,assign) NSUInteger* tag;
//定义一个代理对象
//代理对象会执行协议函数，达到代理对象改变本身属性的目的
//代理对象一定要实现代理协议
@property (nonatomic, assign) id<VCSecendDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
