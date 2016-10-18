//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOListInteractorIO.h"
#import "TOListModuleInterface.h"

@class TOListWireframe;
@protocol TOListViewInterface;
@protocol TODetailViewInterface;

@interface TOListPresenter : NSObject <TOListInteractorOutput, TOListModuleInterface>

@property (nonatomic, strong) id<TOListInteractorInput>                 listInteractor;
@property (nonatomic, strong) TOListWireframe*                          listWireframe;

@property (nonatomic, strong) UIViewController<TOListViewInterface>*   userInterface;
@property (nonatomic, strong) UIViewController<TODetailViewInterface>* detailInterface;

@end