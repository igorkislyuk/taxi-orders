//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListDisplayTaxiOrdersData, TOListDisplayTaxiOrdersItem;

@protocol TOListViewInterface <NSObject>

- (void)showNoData;
- (void)showTaxiOrders:(TOListDisplayTaxiOrdersData *)data;
- (void)updateTaxiOrder:(TOListDisplayTaxiOrdersItem *)item;

@end