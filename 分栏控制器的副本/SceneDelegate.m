//
//  SceneDelegate.m
//  分栏控制器
//
//  Created by 付闯 on 2023/5/30.
//

#import "SceneDelegate.h"
#import "VCFirst.h"
#import "VCSecend.h"
#import "VCThird.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    [self.window makeKeyAndVisible];
    
    VCFirst* vcFirst = [[VCFirst alloc] init];
    
    
    VCSecend* vcSecend = [[VCSecend alloc] init];
    vcSecend.view.backgroundColor = [UIColor yellowColor];
    
    VCThird* vcThird = [[VCThird alloc] init];
    vcThird.view.backgroundColor = [UIColor orangeColor];
    
    vcFirst.title = @"视图1";
    vcSecend.title = @"视图2";
    vcThird.title = @"视图3";
    //创建分栏控制器对象
    vcFirst.view.backgroundColor =  [UIColor blueColor];
    UITabBarController* tbcontrolller = [[UITabBarController alloc] init];
    NSArray* arrayVC = [NSArray arrayWithObjects:vcFirst, vcSecend, vcThird, nil];
    //即呐喊分栏控制器管理数组赋值
    tbcontrolller.viewControllers = arrayVC;
    //将分栏控制器作为根视图控制器
    self.window.rootViewController = tbcontrolller;
    //设置选中的视图控制器索引
    //通过索引来确定显示哪一个控制器
    tbcontrolller.selectedIndex = 2;
    //当前选中的控制器对象
    if (tbcontrolller.selectedViewController == vcThird) {
        NSLog(@"当前显示的是控制器三");
    }
    //设置工具栏的透明度
    tbcontrolller.tabBar.translucent = NO;
    tbcontrolller.tabBar.backgroundColor = [UIColor whiteColor];
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
