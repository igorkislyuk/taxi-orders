//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOVehicle.h"
#import "NSString+TOCommon.h"

NSString *const TOVehicleRegNumberKey = @"regNumber";
NSString *const TOVehicleModelNameKey = @"modelName";
NSString *const TOVehiclePhotoKey = @"photo";
NSString *const TOVehicleDriverNameKey = @"driverName";

@interface TOVehicle ()

@end

@implementation TOVehicle

- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        
        _regNumber = [json[TOVehicleRegNumberKey] to_UTF8String];
        _modelName = [json[TOVehicleModelNameKey] to_UTF8String];
        _photoName = json[TOVehiclePhotoKey];
        _driverName = [json[TOVehicleDriverNameKey] to_UTF8String];
        
    }
    return self;
}

@end