//
// Created by Igor on 17/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListDisplayTaxiOrdersItem;

@interface TOListDisplayTaxiOrdersData : NSObject

//There are no sections. But it rather simply to implement

@property (nonatomic, strong, readonly) NSArray<TOListDisplayTaxiOrdersItem *>* items;

- (void)updateWithOrder:(TOListDisplayTaxiOrdersItem *)item;

- (instancetype)initWithOrders:(NSArray *)orders;

@end