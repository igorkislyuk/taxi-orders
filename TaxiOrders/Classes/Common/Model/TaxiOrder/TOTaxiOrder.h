//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@class TOAddress;
@class TOPrice;
@class TOVehicle;

@interface TOTaxiOrder : NSObject

@property (nonatomic, assign) NSUInteger id;

//addresses
@property (nonatomic, strong) TOAddress *startAddress;
@property (nonatomic, strong) TOAddress *endAddress;

@property (nonatomic, strong) NSDate *orderTime;

@property (nonatomic, strong) TOPrice *price;

@property (nonatomic, strong) TOVehicle *vehicle;

@end