//
//  FKPrinter.h
//  正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>
#import "KKPrintable.h"
NS_ASSUME_NONNULL_BEGIN
//继承NSObject, 遵守FKPrint协议
@interface FKPrinter : NSObject <KKPrintable>

@end

NS_ASSUME_NONNULL_END
