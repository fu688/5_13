//
//  xiyouMobilePerson.h
//  test.2
//
//  Created by 付闯 on 2023/5/26.
//

#import "Person.h"
#import "Demand.h"
NS_ASSUME_NONNULL_BEGIN

@interface xiyouMobilePerson : Person <Demand>
{
   @protected
   int iOS;
   int web;
   NSString* andriod;
   NSString* server;
}
- (void)setiOS:(int)_iOS;
- (int)iOS;
- (void)setweb:(int)_web;
- (int)web;
- (void)setandriod:(NSString*)_andriod;
- (NSString*)andriod;
- (void)setserver:(NSString*)_server;
- (NSString*)server;
@end

NS_ASSUME_NONNULL_END
