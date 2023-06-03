//
//  main.m
//  test.2
//
//  Created by 付闯 on 2023/5/26.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "xiyouMobilePerson.h"
#import "model.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /*NSLog(@"Hello, World!");
         NSString* name = @"fc";
         NSString* name1 = [NSString stringWithFormat:@"ghk"];
         NSString* name2  = [NSString stringWithFormat:@"付闯"];
         NSString* name3 = [NSString stringWithFormat:@"qtyryuuyiuiu"];
         NSLog(@"%@, %@, %@, %@", [name class], [name1 class], [name2 class], [name3 class]);*/
         Person* p = [[Person alloc] init];
         NSLog(@"%@, %d", p.name, p.age);
         NSLog(@"%@", p);
         xiyouMobilePerson* r = [[xiyouMobilePerson alloc] init];
         [r setiOS:10];
         [r setweb:11];
         [r setandriod:@"fu"];
         [r setserver:@"chuang"];
         NSLog(@"%d, %d, %@, %@", [r iOS], [r web], [r andriod], [r server]);
         [r calculate];
         model* s = [[model alloc] init];
         xiyouMobilePerson* r1 = [[xiyouMobilePerson alloc] init];
         [r1 setiOS:10];
         [r1 setweb:11];
         [r1 setandriod:@"fu"];
         [r1 setserver:@"chuang"];
         xiyouMobilePerson* r2 = [[xiyouMobilePerson alloc] init];
         [r2 setiOS:14];
         [r2 setweb:11];
         [r2 setandriod:@"fu"];
         [r2 setserver:@"chuang"];
         xiyouMobilePerson* r3 = [[xiyouMobilePerson alloc] init];
         [r3 setiOS:12];
         [r3 setweb:11];
         [r3 setandriod:@"fu"];
         [r3 setserver:@"chuang"];
         xiyouMobilePerson* r4 = [[xiyouMobilePerson alloc] init];
         [r4 setiOS:13];
         [r4 setweb:11];
         [r4 setandriod:@"fu"];
         [r4 setserver:@"chuang"];
         xiyouMobilePerson* r5 = [[xiyouMobilePerson alloc] init];
         [r5 setiOS:11];
         [r5 setweb:11];
         [r5 setandriod:@"fu"];
         [r5 setserver:@"chuang"];
         s.xiyouMoblieArray = [NSMutableArray arrayWithObjects:r1, r2, r3, r4, r5, nil];
         /*[s.xiyouMoblieArray sortedArrayUsingComparator:^(id obj1, id obj2) {
            if ([obj1 iOS] < [obj2 iOS]) {
                return NSOrderedAscending;
            }
            if ([obj1 iOS] > [obj2 iOS]) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
                }];*/
        for (id object in s.xiyouMoblieArray) {
        NSLog(@"%@", object);
            
        }
        NSLog(@"%@", s.xiyouMoblieArray[4]);
         [s.xiyouMoblieArray removeObjectsInRange:NSMakeRange(2, 3)];
         for (id object in s.xiyouMoblieArray) {
         NSLog(@"%@", object);
             
         }
    }
    return 0;
}
