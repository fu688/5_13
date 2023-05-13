//
//  KKPrintable.h
//  正式协议
//
//  Created by 付闯 on 2023/5/5.
//

#import <Foundation/Foundation.h>
#import "FKProductable.h"
#import "FKoutput.h"
NS_ASSUME_NONNULL_BEGIN

@protocol KKPrintable <FKProductable, FKoutput>
- (NSString*) printColor;
@end

NS_ASSUME_NONNULL_END
