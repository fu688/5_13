//
//  main.m
//  天气预报项目
//
//  Created by 付闯 on 2023/8/1.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
   return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
