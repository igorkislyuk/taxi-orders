//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOTaxiOrder;

@protocol TOListInteractorInput <NSObject>

- (void)startLoadData;

- (BOOL)shouldLoadData;

@end

@protocol TOListInteractorOutput <NSObject>

- (void)showNewOrders:(NSArray *)orders; //array of TOTaxiOrder

- (void)updateOrder:(TOTaxiOrder *)taxiOrder;

@end