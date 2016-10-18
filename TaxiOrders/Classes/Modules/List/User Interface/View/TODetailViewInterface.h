//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListDisplayTaxiOrdersItem;

@protocol TODetailViewInterface <NSObject>

- (void)updateWithItem:(TOListDisplayTaxiOrdersItem *)item;

@end