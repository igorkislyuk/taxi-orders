//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOTaxiOrder.h"
#import "TOAddress.h"
#import "TOPrice.h"
#import "TOVehicle.h"

NSString *const TOTaxiOrderStartAddressKey = @"startAddress";
NSString *const TOTaxiOrderEndAddressKey = @"endAddress";
NSString *const TOTaxiOrderIDKey = @"id";
NSString *const TOTaxiOrderPriceKey = @"price";
NSString *const TOTaxiOrderOrderTimeKey = @"orderTime";
NSString *const TOTaxiOrderVehicleKey = @"vehicle";

@interface TOTaxiOrder ()



@end

@implementation TOTaxiOrder

- (instancetype)initWithDictionary:(NSDictionary *)json {
    if (self = [super init]) {

        //get start and end address
        TOAddress *startAddress = [[TOAddress alloc] initWithDictionary:json[TOTaxiOrderStartAddressKey]];
        TOAddress *endAddress = [[TOAddress alloc] initWithDictionary:json[TOTaxiOrderEndAddressKey]];
        
        _endAddress = endAddress;
        _startAddress = startAddress;

        //get id
        _id = [json[TOTaxiOrderIDKey] unsignedIntegerValue];

        //get price
        _price = [[TOPrice alloc] initWithDictionary:json[TOTaxiOrderPriceKey]];

        //get time
        _orderTime = [self dateFromString:json[TOTaxiOrderOrderTimeKey]];

        //get vehicle
        _vehicle = [[TOVehicle alloc] initWithJSON:json[TOTaxiOrderVehicleKey]];

    }
    return self;
}

- (NSString *)description {

    TOTaxiOrder *taxiOrder = self;

    //logs
    NSLog(@"taxiOrder.startAddress.cityString = %@", taxiOrder.startAddress.cityString);
    NSLog(@"taxiOrder.startAddress.addressString = %@", taxiOrder.startAddress.addressString);

    NSLog(@"taxiOrder.endAddress.addressString = %@", taxiOrder.endAddress.addressString);
    NSLog(@"taxiOrder.endAddress.cityString = %@", taxiOrder.endAddress.cityString);

    NSLog(@"taxiOrder.id = %u", taxiOrder.id);

    NSLog(@"taxiOrder.orderTime = %@", taxiOrder.orderTime);

    NSLog(@"taxiOrder.price.fractionalPart = %u", taxiOrder.price.fractionalPart);
    NSLog(@"taxiOrder.price.unitPart = %u", taxiOrder.price.unitPart);
    NSLog(@"taxiOrder.price.currency = %@", taxiOrder.price.currency);

    NSLog(@"taxiOrder.vehicle.driverName = %@", taxiOrder.vehicle.driverName);
    NSLog(@"taxiOrder.vehicle.modelName = %@", taxiOrder.vehicle.modelName);
    NSLog(@"taxiOrder.vehicle.regNumber = %@", taxiOrder.vehicle.regNumber);
    NSLog(@"taxiOrder.vehicle.photoName = %@", taxiOrder.vehicle.photoName);

    return [super description];
}

- (nullable NSDate *)dateFromString:(NSString *)string {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    //parse date
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

    NSDate *date = [dateFormatter dateFromString:string];
    
    return date;
}

- (nullable NSString *)dateDescription {
    if (!self.orderTime) {
        return nil;
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:@"hh:mm:ss dd.M.yy"];

    return [dateFormatter stringFromDate:self.orderTime];

}

@end