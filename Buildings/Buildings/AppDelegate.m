//
//  AppDelegate.m
//  Buildings
//
//  Created by zhangbin on 6/10/15.
//  Copyright (c) 2015 zoombin. All rights reserved.
//

#import "AppDelegate.h"
#import "RecommendedViewController.h"
#import "MeViewController.h"
#import "Header.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSMutableArray *controllers = [NSMutableArray array];
	
	RecommendedViewController *recommendedViewController = [[RecommendedViewController alloc] initWithNibName:nil bundle:nil];
	[controllers addObject:[[UINavigationController alloc] initWithRootViewController:recommendedViewController]];
	
	MeViewController *meViewController = [[MeViewController alloc] initWithNibName:nil bundle:nil];
	[controllers addObject:[[UINavigationController alloc] initWithRootViewController:meViewController]];
	
	UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
	tabBarController.viewControllers = controllers;
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = tabBarController;
	[self.window makeKeyAndVisible];
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
	NSLog(@"url recieved: %@", url);
	NSString *scheme = [url	 scheme];
	if ([scheme.uppercaseString isEqualToString:APP_SCHEME.uppercaseString]) {
		NSString *query = [url query];
		if ([query.uppercaseString isEqualToString:OPEN_CONTACTS.uppercaseString]) {
			[[NSNotificationCenter defaultCenter] postNotificationName:OPEN_CONTACTS object:nil];
		}
	}
	return YES;
}

@end
