//
//  AppDelegate.m
//  TabbarDemo
//
//  Created by yangL on 15/3/17.
//  Copyright (c) 2015年 yangL. All rights reserved.
//

#import "AppDelegate.h"
#import "LYTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary *dict1 = [NSDictionary  dictionaryWithObjectsAndKeys:@"NewsViewController", kViewController,@"新闻",kNormalImage, @"新闻2", kSelectedImage, nil];
    NSDictionary *dict2 = [NSDictionary  dictionaryWithObjectsAndKeys:@"TopicViewController", kViewController,@"论坛",kNormalImage, @"论坛2", kSelectedImage, nil];
    NSDictionary *dict3 = [NSDictionary  dictionaryWithObjectsAndKeys:@"PicViewController", kViewController,@"活动",kNormalImage, @"活动2", kSelectedImage, nil];
    NSDictionary *dict4 = [NSDictionary  dictionaryWithObjectsAndKeys:@"CommentViewController", kViewController,@"助理",kNormalImage, @"助理2", kSelectedImage, nil];
    NSDictionary *dict5 = [NSDictionary  dictionaryWithObjectsAndKeys:@"VoteViewController", kViewController,@"设置",kNormalImage, @"设置2", kSelectedImage, nil];
    
    NSArray *arr = @[dict1, dict2, dict3, dict4, dict5];
    
    LYTabBarController *lyTabBar = [[LYTabBarController alloc] init];
    //重写父类的setViewControllers方法
    [lyTabBar setViewControllers:arr];
    
    self.window.rootViewController = lyTabBar;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
