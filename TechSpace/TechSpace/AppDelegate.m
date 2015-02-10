//
//  AppDelegate.m
//  TechSpace
//
//  Created by Kenichi Saito on 2/9/15.
//  Copyright (c) 2015 FarConnection. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "FeedViewController.h"
#import "UserViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *TVC = [[UITabBarController alloc] init];
    
    HomeViewController* home = [[HomeViewController alloc] init];
    FeedViewController* feed = [[FeedViewController alloc] init];
    UserViewController* user = [[UserViewController alloc] init];
    
    
    NSArray* controllers = @[home, feed, user];
    
    TVC.viewControllers = controllers;
    TVC.tabBar.translucent = NO;
    TVC.tabBar.tintColor = [UIColor blackColor];
    
    NSArray *tabs = TVC.tabBar.items;
    [tabs[0] setTitle:@"Home"];
    [tabs[1] setTitle:@"Feed"];
    [tabs[2] setTitle:@"User"];
    
    UINavigationController* NC = [[UINavigationController alloc] initWithRootViewController:TVC];
    _window.rootViewController = NC;

    [_window makeKeyAndVisible];
    
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
