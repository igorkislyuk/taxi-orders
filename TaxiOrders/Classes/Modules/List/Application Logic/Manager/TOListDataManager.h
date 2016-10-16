//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TOListDataManager : NSObject

/**
 * Load data from remote server
 * @param completionHandler With array of TOTaxiOrder
 */
- (void)loadData:(void(^)(NSArray *taxiOrders))completionHandler;

@end