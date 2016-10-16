//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TODisplayTaxiOrdersData.h"
#import "TODisplayTaxiOrdersItem.h"
#import "TOTaxiOrder.h"
#import "TOAddress.h"


@implementation TODisplayTaxiOrdersData

- (instancetype)initWithOrders:(NSArray *)orders {
    if (self = [super init]) {

        _items = [TODisplayTaxiOrdersData dataFromOrders:orders];

    }
    return self;
}

/**
 * Convert method
 * @param orders
 * @return Array of TODisplayTaxiOrdersItem
 */
+ (NSArray *)dataFromOrders:(NSArray *)orders {
    NSMutableArray *displayOrders = [[NSMutableArray alloc] init];
    for (TOTaxiOrder *taxiOrder in orders) {

        TODisplayTaxiOrdersItem *item = [[TODisplayTaxiOrdersItem alloc] init];
        item.cityString = taxiOrder.startAddress.cityString;

        [displayOrders addObject:item];
    }
    return displayOrders;
}


@end