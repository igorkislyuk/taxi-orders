//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TORootWireframe;
@class TOListPresenter;

@interface TOListWireframe : NSObject

@property (nonatomic, strong) TORootWireframe *rootWireframe;
@property (nonatomic, strong) TOListPresenter *listPresenter;
//@property (nonatomic, strong) TODetailWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window;

- (void)presentDetailInterfaceInList;

@end