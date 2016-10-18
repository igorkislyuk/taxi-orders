//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOAppDependencies.h"

//Root
#import "TORootWireframe.h"

//List
#import "TOListWireframe.h"
#import "TOListPresenter.h"
#import "TOListInteractor.h"
#import "TOListOrdersManager.h"

@interface TOAppDependencies()

@property (nonatomic, strong) TOListWireframe *listWireframe;

@end

@implementation TOAppDependencies

- (instancetype)init {
    if (self = [super init]) {
        [self configureDependencies];
    }
    return self;
}

- (void)configureDependencies {

    //Root level
    TORootWireframe *rootWireframe = [[TORootWireframe alloc] init];

    //List level
    TOListWireframe *listWireframe = [[TOListWireframe alloc] init];
    TOListPresenter *listPresenter = [[TOListPresenter alloc] init];
    TOListInteractor *listInteractor = [[TOListInteractor alloc] init];

    listInteractor.output = listPresenter;

    listPresenter.listInteractor = listInteractor;
    listPresenter.listWireframe = listWireframe;

    // TODO: DETAIL WIREFRAME
    listWireframe.rootWireframe = rootWireframe;
    listWireframe.listPresenter = listPresenter;
    self.listWireframe = listWireframe;
    


}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self.listWireframe presentListInterfaceFromWindow:window];
}


@end