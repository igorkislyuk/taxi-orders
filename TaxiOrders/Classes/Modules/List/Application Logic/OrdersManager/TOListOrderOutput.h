//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListOrdersManager;
@class TOTaxiOrder;

@protocol TOListOrderOutput <NSObject>

@required
- (void)ordersManager:(TOListOrdersManager *)manager didLoadOrders:(NSArray<__kindof TOTaxiOrder *> *)orders;

@required
- (void)ordersManager:(TOListOrdersManager *)manager didUpdateStyle:(TOTaxiOrder *)order;

@end