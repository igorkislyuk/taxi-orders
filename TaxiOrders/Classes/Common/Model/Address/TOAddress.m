//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOAddress.h"

NSString *const TOAddressCityKey = @"city";
NSString *const TOAddressAddressKey = @"address";

@interface TOAddress ()



@end

@implementation TOAddress

- (instancetype)initWithDictionary:(NSDictionary *)userInfo {
    if (self = [super init]) {

        //get value from dictionary to data
        _cityString = [self stringFromUTF8String:userInfo[TOAddressCityKey]];
        _addressString = [self stringFromUTF8String:userInfo[TOAddressAddressKey]];

    }
    return self;
}

- (NSString *)stringFromUTF8String:(NSString *)UTF8String {
    NSData *data = [UTF8String dataUsingEncoding:NSUTF8StringEncoding];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


@end