//
//  xiyouMobilePerson.m
//  test.2
//
//  Created by 付闯 on 2023/5/26.
//

#import "xiyouMobilePerson.h"

@implementation xiyouMobilePerson
- (void)setiOS:(int) _iOS {
    iOS = _iOS;
    if (_iOS % 2 == 0) {
        iOS--;
    } else if (_iOS != 0) {
        iOS++;
    }
}
- (int)iOS {
    return iOS;
}
- (void)setweb:(int) _web {
    web = _web;
}
- (int)web {
    return web;
}
- (void)setandriod:(NSString*) _andriod {
    andriod = _andriod;
}
- (NSString*)andriod {
    return andriod;
}
- (void)setserver:(NSString*) _server {
    server = _server;
}
- (NSString*)server {
    return server;
}
- (void) calculate {
    NSLog(@"%d", web + iOS);
}
- (NSString*)description {
    return [NSString stringWithFormat:@"<xiyouMobilePerson[iOS = %d, web = %d, androiod = %@, server = %@]>", iOS, web, andriod, server];
}
@end
