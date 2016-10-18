//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOPrice.h"

NSString *const TOPriceAmountKey = @"amount";
NSString *const TOPriceCurrencyKey = @"currency";

@implementation TOPrice

- (instancetype)initWithDictionary:(NSDictionary *)json {
    if (self = [super init]) {
        
        _currency = json[TOPriceCurrencyKey];

        double totalNumber = [json[TOPriceAmountKey] doubleValue];

        _unitPart = (NSUInteger) (totalNumber / 100);

        _fractionalPart = (NSUInteger) ((totalNumber - _unitPart * 100) * 100);
        
    }
    return self;
}

@end