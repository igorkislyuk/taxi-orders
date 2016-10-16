//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TODisplayTaxiOrdersItem;

@interface TODisplayTaxiOrdersData : NSObject

//There are no sections. But it rather simply to implement

@property (nonatomic, strong, readonly) NSArray<TODisplayTaxiOrdersItem *>* items;

- (instancetype)initWithOrders:(NSArray *)orders;

@end