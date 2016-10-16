//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListInteractorIO.h"
#import "TOListModuleInterface.h"
#import "TOListPresenter.h"
#import "TOListViewInterface.h"
#import "TODisplayTaxiOrdersData.h"

@interface TOListPresenter()

@end

@implementation TOListPresenter

#pragma mark - TOListModuleInterface

- (void)startLoadData {

    [self.listInteractor startLoadData];
    [self.userInterface showNoData];

}

- (void)showNewOrders:(NSArray *)orders {

    TODisplayTaxiOrdersData *data = [[TODisplayTaxiOrdersData alloc] initWithOrders:orders];

    [[self userInterface] showTaxiOrders:data];

}


@end