//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOAppDelegate.h"
#import "TOAppDependencies.h"

@interface TOAppDelegate ()

@property (nonatomic, strong) TOAppDependencies *appDependencies;

@end

@implementation TOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //configure dependencies
    self.appDependencies = [[TOAppDependencies alloc] init];

    [[self appDependencies] installRootViewControllerIntoWindow:self.window];


    return YES;
}

@end