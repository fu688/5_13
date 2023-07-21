//
//  SceneDelegate.m
//  网易云音乐
//
//  Created by 付闯 on 2023/7/17.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "OpenViewController.h"
#import "MyFindViewController.h"
#import "MyVideoViewController.h"
#import "CommunityViewController.h"
#import "MysViewController.h"
#import "MyAccountViewController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    NSTimer* timerView = [[NSTimer alloc] init];
    timerView = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:NO];
    OpenViewController* opView = [[OpenViewController alloc] init];
    self.window.rootViewController = opView;
    [self.window makeKeyAndVisible];
    
}
-(void) timer {
    UITabBarController* tbcontroller = [[UITabBarController alloc] init];
    
    MyFindViewController* findView = [[MyFindViewController alloc] init];
    UINavigationController* naFindView = [[UINavigationController alloc] initWithRootViewController:findView];
    
    MyVideoViewController* videoView = [[MyVideoViewController alloc] init];
    UINavigationController* naVideoView = [[UINavigationController alloc] initWithRootViewController:videoView];
    
    CommunityViewController* comView = [[CommunityViewController alloc] init];
    UINavigationController* nacomView = [[UINavigationController alloc] initWithRootViewController:comView];
    
    MysViewController* MysView = [[MysViewController alloc] init];
    UINavigationController* naMysView = [[UINavigationController alloc] initWithRootViewController:MysView];
    MyAccountViewController* accountView = [[MyAccountViewController alloc] init];
    UINavigationController* naAccountView = [[UINavigationController alloc] initWithRootViewController:accountView];
    MysView.title = @"我的";
    NSArray* arrays = [NSArray arrayWithObjects:naFindView, naVideoView, nacomView, naAccountView, naMysView, nil];
    tbcontroller.viewControllers = arrays;
    tbcontroller.tabBar.translucent = NO;
    tbcontroller.tabBar.backgroundColor = [UIColor whiteColor];
    /*UIWindowScene *windowScene = (UIWindowScene *)[[[UIApplication sharedApplication] connectedScenes] anyObject];
    NSArray<UIWindow *> *windows = windowScene.windows;
    UIWindow *window = windows.firstObject;*/
    //UIWindow* window = [[[UIApplication sharedApplication] windows] firstObject];
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = tbcontroller;
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"tab-wang-yiyun.png"] tag:101];
    findView.tabBarItem = tabBarItem;
    UITabBarItem* tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"博客" image:[UIImage imageNamed:@"bokeguanli.png"] tag:101];
    videoView.tabBarItem = tabBarItem1;
    UITabBarItem* tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"社区" image:[UIImage imageNamed:@"shequ-weijihuo.png"] tag:101];
    comView.tabBarItem = tabBarItem2;
    UITabBarItem* tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"shezhi-2.png"] tag:101];
    accountView.tabBarItem = tabBarItem4;
    UITabBarItem* tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"yinle.png"] tag:101];
    MysView.tabBarItem = tabBarItem3;
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
