//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListInteractorIO.h"

#import "TOListInteractor.h"

//data manager
#import "TOListDataManager.h"

@interface TOListInteractor()

@property (nonatomic, strong) TOListDataManager *dataManager;

@end

@implementation TOListInteractor

- (instancetype)initWithDataManager:(TOListDataManager *)listDataManager {
    if (self = [super init]) {
        _dataManager = listDataManager;
    }
    return self;
}

#pragma mark - TOListInteractorInput

- (void)startLoadData {

    __weak typeof(self) welf = self;
    void (^completionHandler)(NSArray *)=^(NSArray *taxiOrders) {

        __strong typeof(self) strongSelf = welf;
        if (!strongSelf) {
            return;
        }

        [strongSelf.output showNewOrders:taxiOrders];

    };
    [self.dataManager loadData:completionHandler];

}

@end