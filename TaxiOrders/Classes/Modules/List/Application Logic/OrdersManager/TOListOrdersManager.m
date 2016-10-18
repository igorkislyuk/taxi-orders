//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListOrdersManager.h"
#import "TOListOrdersManagerConstants.h"
#import "TOTaxiOrder.h"
#import "TOAddress.h"
#import "TOPrice.h"
#import "TOVehicle.h"
#import "TOListOrderOutput.h"

@interface TOListOrdersManager()

@end

@implementation TOListOrdersManager

- (void)loadData {

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:TOListOrdersManagerServerAddress]];

    __weak typeof(self) weakSelf = self;
    void (^pFunction)(NSData *, NSURLResponse *, NSError *)=^(NSData *data, NSURLResponse *response, NSError *error) {

        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }

        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];

        //call completion
        NSArray *orders = [strongSelf taxiOrdersWithin:json];
        strongSelf->_orders = orders;

        if (strongSelf.output) {
            [strongSelf.output ordersManager:strongSelf didLoadOrders:orders];
        }

    };
    
    NSURLSessionDataTask *sessionDataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest
                                                                            completionHandler:pFunction];
    [sessionDataTask resume];
}

- (void)updateImageWithID:(NSUInteger)id image:(UIImage *)image {
    for (TOTaxiOrder *taxiOrder in self.orders) {
        if ([taxiOrder id] == id) {
            //this one order

            taxiOrder.vehicle.vehicleImage = image;

            if (self.output) {
                [self.output ordersManager:self didUpdateStyle:taxiOrder];
            }

            break;
        }
    }
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