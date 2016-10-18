//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOAddress.h"
#import "NSString+TOCommon.h"

NSString *const TOAddressCityKey = @"city";
NSString *const TOAddressAddressKey = @"address";

@interface TOAddress ()



@end

@implementation TOAddress

- (instancetype)initWithDictionary:(NSDictionary *)userInfo {
    if (self = [super init]) {

        //get value from dictionary to data
        _cityString = [userInfo[TOAddressCityKey] to_UTF8String];
        _addressString = [userInfo[TOAddressAddressKey] to_UTF8String];

    }
    return self;
}

@end