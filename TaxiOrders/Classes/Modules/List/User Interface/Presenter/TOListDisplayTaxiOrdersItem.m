//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListDisplayTaxiOrdersItem.h"
#import "TOTaxiOrder.h"

@implementation TOListDisplayTaxiOrdersItem

- (instancetype)initWithTaxiOrder:(TOTaxiOrder *)taxiOrder {
    if (self = [super init]) {
        _taxiOrder = taxiOrder;
    }
    return self;
}

@end