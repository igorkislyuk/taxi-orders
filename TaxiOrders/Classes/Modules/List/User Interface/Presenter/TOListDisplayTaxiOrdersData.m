//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListDisplayTaxiOrdersData.h"
#import "TOListDisplayTaxiOrdersItem.h"
#import "TOTaxiOrder.h"
#import "TOAddress.h"


@implementation TOListDisplayTaxiOrdersData

- (instancetype)initWithOrders:(NSArray *)orders {
    if (self = [super init]) {

        _items = [TOListDisplayTaxiOrdersData dataFromOrders:orders];

    }
    return self;
}

- (void)updateWithOrder:(TOListDisplayTaxiOrdersItem *)item {

    NSMutableArray *array = _items.mutableCopy;

    for (NSUInteger i = 0; i < [array count]; ++i) {
        TOListDisplayTaxiOrdersItem *ordersItem = array[i];

        if (ordersItem.taxiOrder.id == item.taxiOrder.id) {
            array[i] = item;
            break;
        }
    }

    _items = array;

}

/**
 * Convert method
 * @param orders
 * @return Array of TODisplayTaxiOrdersItem
 */
+ (NSArray *)dataFromOrders:(NSArray *)orders {
    NSMutableArray *displayOrders = [[NSMutableArray alloc] init];
    for (TOTaxiOrder *taxiOrder in orders) {
        TOListDisplayTaxiOrdersItem *item = [[TOListDisplayTaxiOrdersItem alloc] initWithTaxiOrder:taxiOrder];
        [displayOrders addObject:item];
    }
    return displayOrders;
}


@end