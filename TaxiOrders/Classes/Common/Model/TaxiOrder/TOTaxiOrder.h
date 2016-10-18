//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOAddress;
@class TOPrice;
@class TOVehicle;

@interface TOTaxiOrder : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)json;

/**
 *
 * @return Russian description of date & time
 */
- (NSString *)dateDescription;

@property (nonatomic, assign, readonly) NSUInteger id;

//addresses
@property (nonatomic, strong, readonly) TOAddress *startAddress;
@property (nonatomic, strong, readonly) TOAddress *endAddress;

@property (nonatomic, strong, readonly) NSDate *orderTime;

@property (nonatomic, strong, readonly) TOPrice *price;

@property (nonatomic, strong, readonly) TOVehicle *vehicle;

@end