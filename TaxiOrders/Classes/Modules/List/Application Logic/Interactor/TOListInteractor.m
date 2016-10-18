//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListInteractorIO.h"

#import "TOListInteractor.h"

//data manager
#import "TOListOrdersManager.h"
#import "TOCacheImageManager.h"

@interface TOListInteractor()

@property (nonatomic, strong) TOListOrdersManager *ordersManager;

@property(nonatomic, strong) TOCacheImageManager *cacheManager;

@end

@implementation TOListInteractor

- (instancetype)init {
    self = [super init];
    if (self) {
        _ordersManager = [[TOListOrdersManager alloc] init];
        _cacheManager = [[TOCacheImageManager alloc] init];

        _cacheManager.output = self;
        _ordersManager.output = self;
    }

    return self;
}

- (void)startLoadData {
    [self.ordersManager loadData];
}

- (BOOL)shouldLoadData {
    return self.ordersManager.orders == nil || self.ordersManager.orders.count == 0;
}

#pragma mark - TOCacheImageManagerOutput

- (void)image:(UIImage *)image didLoadForOrderID:(NSUInteger)orderID {
    [self.ordersManager updateImageWithID:orderID image:image];
}

#pragma mark - TOListOrderOutput

- (void)ordersManager:(TOListOrdersManager *)manager didLoadOrders:(NSArray<__kindof TOTaxiOrder *> *)orders {
    if (self.output) {
        [self.output showNewOrders:orders];
    }

    [self.cacheManager getImagesForOrders:orders];

}

- (void)ordersManager:(TOListOrdersManager *)manager didUpdateStyle:(TOTaxiOrder *)order {
    if (self.output) {
        [self.output updateOrder:order];
    }
}


@end