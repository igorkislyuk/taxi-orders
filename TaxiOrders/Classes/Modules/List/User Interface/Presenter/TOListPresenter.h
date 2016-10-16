//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOListInteractorIO.h"

@class TOListWireframe;
@protocol TOListViewInterface, TOListInteractorInput, TOListModuleInterface;

@interface TOListPresenter : NSObject <TOListInteractorOutput, TOListModuleInterface>

@property (nonatomic, strong) id<TOListInteractorInput>                 listInteractor;
@property (nonatomic, strong) TOListWireframe*                          listWireframe;

@property (nonatomic, strong) UIViewController<TOListViewInterface>*   userInterface;

@end