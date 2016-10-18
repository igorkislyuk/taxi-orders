//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOTaxiOrder;
@protocol TOListOrderOutput;


@interface TOListOrdersManager : NSObject

@property (nonatomic, readonly, nullable) NSArray<TOTaxiOrder *> *orders;

/**
 * Load data from remote server
 */
- (void)loadData;

/**
 * Set new image for vehicle
 * @param id Identifier of taxiOrder
 * @param image New image for set
 */
- (void)updateImageWithID:(NSUInteger)id image:(nullable UIImage *)image;

@property (nonatomic, weak) __nullable id <TOListOrderOutput> output;

@end