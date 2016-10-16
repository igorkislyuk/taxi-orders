//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListWireframe.h"
#import "TORootWireframe.h"
#import "TOListPresenter.h"
#import "TOListViewController.h"

@interface TOListWireframe()

@property (nonatomic, strong) TOListViewController *listViewController;

@end

@implementation TOListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window {
    
    TOListViewController *listViewController = [self listViewControllerFromNib];

    listViewController.eventHandler = self.listPresenter;
    self.listPresenter.userInterface = listViewController;
    self.listViewController = listViewController;

    [self.rootWireframe showRootViewController:listViewController
                                      inWindow:window];

}

- (TOListViewController *)listViewControllerFromNib {

    TOListViewController *listViewController = [[TOListViewController alloc] initWithNibName:NSStringFromClass([TOListViewController class])
                                                                                      bundle:nil];

    return listViewController;

}

@end