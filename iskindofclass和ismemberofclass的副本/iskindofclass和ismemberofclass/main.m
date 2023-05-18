//
//  main.m
//  iskindofclass和ismemberofclass
//
//  Created by 付闯 on 2023/5/16.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //instacne-isKindOfClass
              BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
               BOOL res3 = [[Person class] isKindOfClass:[Person class]];
               BOOL res10 = [[NSString class] isKindOfClass:[NSObject class]];
        
                NSLog(@"%d %d %d",res1, res3, res10);
                
                
                Person *person = [[Person alloc] init];
                BOOL res5 = [[Person class] isKindOfClass:[NSObject class]];
                BOOL res6 = [person isKindOfClass:[NSObject class]];
                NSLog(@"%d %d", res5, res6);
        
                //instance-isMemberOfClass
                BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
                BOOL res7 = [person isMemberOfClass:[NSObject class]];
                BOOL res8 = [[Person class] isMemberOfClass:[NSObject class]];
                BOOL res9 = [person isMemberOfClass:[Person class]];
                NSLog(@"%d %d %d %d" ,res2, res7, res8, res9);    }
    return 0;
}
