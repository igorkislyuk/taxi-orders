//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOTaxiOrder.h"
@class TOTaxiOrder;

@interface TOListDisplayTaxiOrdersItem : NSObject

- (instancetype)initWithTaxiOrder:(TOTaxiOrder *)taxiOrder;

@property (nonatomic, readonly) TOTaxiOrder* taxiOrder;

@end