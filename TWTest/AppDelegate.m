//
//  AppDelegate.m
//  TWTest
//
//  Created by 何振东 on 15/3/31.
//  Copyright (c) 2015年 TW. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingsVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    ONavController *nav = [[ONavController alloc] initWithRootViewController:[[SettingsVC alloc] init]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
