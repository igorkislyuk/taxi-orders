//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TODisplayTaxiOrdersData;

@protocol TOListViewInterface <NSObject>

- (void)showNoData;
- (void)showTaxiOrders:(TODisplayTaxiOrdersData *)data;

@end