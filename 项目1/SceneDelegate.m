//
//  SceneDelegate.m
//  项目1
//
//  Created by 付闯 on 2023/7/14.
//

#import "SceneDelegate.h"
#import "VCFirst.h"
#import "VCSecend.h"
#import "VCThird.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    [self.window makeKeyAndVisible];
    
    VCFirst* vcFirst  = [[VCFirst alloc] init];
    vcFirst.view.backgroundColor  = [UIColor whiteColor];
    
    VCSecend* vcSecend = [[VCSecend alloc] init];
    
    VCThird* vcThird = [[VCThird alloc] init];
    
    UINavigationController* naThird = [[UINavigationController alloc] initWithRootViewController:vcThird];
    
    UITabBarController* tbcontroller = [[UITabBarController alloc] init];
    NSArray* arrayVC = [NSArray arrayWithObjects:vcFirst, vcSecend, naThird, nil];
    tbcontroller.viewControllers = arrayVC;
    self.window.rootViewController = tbcontroller;
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"shouye.png"] tag:101];
    vcFirst.tabBarItem = tabBarItem;
    UITabBarItem* tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"31wode.png"] tag:101];
    vcThird.tabBarItem = tabBarItem1;
    UITabBarItem* tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"通讯录" image:[UIImage imageNamed:@"tongxunlu.png"] tag:101];
    vcSecend.tabBarItem = tabBarItem3;
    tbcontroller.tabBar.translucent = NO;
    tbcontroller.tabBar.backgroundColor = [UIColor whiteColor];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
