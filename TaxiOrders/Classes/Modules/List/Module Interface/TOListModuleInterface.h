//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListDisplayTaxiOrdersItem;

@protocol TOListModuleInterface <NSObject>

- (void)startLoadData;

- (BOOL)shouldLoadData;

- (void)showOrderDetail:(TOListDisplayTaxiOrdersItem *)item;

@end