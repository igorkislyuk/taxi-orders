//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOVehicle : NSObject

- (instancetype)initWithJSON:(NSDictionary *)json;

@property (nonatomic, readonly, copy) NSString *regNumber;
@property (nonatomic, readonly, copy) NSString *modelName;
@property (nonatomic, readonly, copy) NSString *photoName;

/**
 * Image, that downloaded using photoName
 * @sa photoName
 */
@property (nonatomic, strong) UIImage *vehicleImage;

@property (nonatomic, readonly, copy) NSString *driverName;

@end