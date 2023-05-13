//
//  FKPreant.h
//  supper访问隐藏变量
//
//  Created by 付闯 on 2023/5/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FKPreant : NSObject
{
    int _a;
}
@property (nonatomic, assign) int a;
@end

NS_ASSUME_NONNULL_END
