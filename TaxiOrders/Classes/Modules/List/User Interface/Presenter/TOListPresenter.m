//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListInteractorIO.h"
#import "TOListModuleInterface.h"
#import "TOListPresenter.h"
#import "TOListViewInterface.h"
#import "TOListDisplayTaxiOrdersData.h"
#import "TODetailViewInterface.h"
#import "TOListDisplayTaxiOrdersItem.h"
#import "TOTaxiOrder.h"
#import "TOVehicle.h"
#import "TOListWireframe.h"

@interface TOListPresenter()

@end

@implementation TOListPresenter

#pragma mark - TOListModuleInterface

- (void)startLoadData {

    [self.listInteractor startLoadData];
    [self.userInterface showNoData];

}

- (BOOL)shouldLoadData {
    return [self.listInteractor shouldLoadData];
}

- (void)showOrderDetail:(TOListDisplayTaxiOrdersItem *)item {

    [self.detailInterface updateWithItem:item];
    
    [self.listWireframe presentDetailInterfaceInList];

}


#pragma mark - TOListInteractorOutput

- (void)showNewOrders:(NSArray *)orders {

    TOListDisplayTaxiOrdersData *data = [[TOListDisplayTaxiOrdersData alloc] initWithOrders:orders];

    [[self userInterface] showTaxiOrders:data];

}

- (void)updateOrder:(TOTaxiOrder *)taxiOrder {
    
    [self.userInterface updateTaxiOrder:[[TOListDisplayTaxiOrdersItem alloc] initWithTaxiOrder:taxiOrder]];
}

@end