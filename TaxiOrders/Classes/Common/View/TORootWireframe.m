//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TORootWireframe.h"


@implementation TORootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window {

    UINavigationController *navigationController = [self navigationControllerForRootViewController:viewController];

    [window setRootViewController:navigationController];

    [window makeKeyAndVisible];
}

- (UINavigationController *)navigationControllerForRootViewController:(UIViewController *)viewController {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    return navigationController;
}

@end