//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListWireframe.h"
#import "TORootWireframe.h"
#import "TOListPresenter.h"
#import "TOListViewController.h"
#import "TODetailViewController.h"

@interface TOListWireframe()

@property (nonatomic, strong) TOListViewController *listViewController;

@property (nonatomic, strong) TODetailViewController *detailViewController;

@end

@implementation TOListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window {
    
    TOListViewController *listViewController = [self listViewControllerFromNib];
    TODetailViewController *detailViewController = [self detailViewControllerFromNib];

    listViewController.eventHandler = self.listPresenter;
    self.listPresenter.userInterface = listViewController;
    self.listPresenter.detailInterface = detailViewController;

    self.listViewController = listViewController;
    self.detailViewController = detailViewController;

    [self.rootWireframe showRootViewController:listViewController
                                      inWindow:window];

}

- (void)presentDetailInterfaceInList {

    [[self.listViewController navigationController] pushViewController:self.detailViewController animated:YES];

}


- (TOListViewController *)listViewControllerFromNib {

    TOListViewController *listViewController = [[TOListViewController alloc] initWithNibName:NSStringFromClass([TOListViewController class])
                                                                                      bundle:nil];

    return listViewController;

}

- (TODetailViewController *)detailViewControllerFromNib {
    return [[TODetailViewController alloc] initWithNibName:NSStringFromClass([TODetailViewController class]) bundle:nil];
}

@end