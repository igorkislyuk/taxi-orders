//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListDataManager.h"
#import "TOListDataManagerConstants.h"
#import "TOTaxiOrder.h"
#import "TOAddress.h"
#import "TOPrice.h"
#import "TOVehicle.h"

@interface TOListDataManager()

@end

@implementation TOListDataManager

- (void)loadData:(void(^)(NSArray *taxiOrders))completionHandler {

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:TOListDataManagerServerAddress]];

    __weak typeof(self) weakSelf = self;
    void (^pFunction)(NSData *, NSURLResponse *, NSError *)=^(NSData *data, NSURLResponse *response, NSError *error) {

        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }

        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];

        //call completion
        completionHandler([strongSelf taxiOrdersWithin:json]);

    };
    
    NSURLSessionDataTask *sessionDataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest
                                                                            completionHandler:pFunction];
    [sessionDataTask resume];
}

- (NSArray *)taxiOrdersWithin:(NSArray *)jsonOrders {

    NSMutableArray *orders = [[NSMutableArray alloc] init];

    for (NSDictionary *dictionary in jsonOrders) {

        //create new order
        TOTaxiOrder *taxiOrder = [[TOTaxiOrder alloc] initWithDictionary:dictionary];
        
        [orders addObject:taxiOrder];

    }

    return orders;
}


@end