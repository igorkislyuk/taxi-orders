//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListDataManager.h"
#import "TOListDataManagerConstants.h"
#import "TOAddress.h"
#import "TOTaxiOrder.h"

NSString *const TOListDataManagerStartAddressKey = @"startAddress";
NSString *const TOListDataManagerEndAddressKey = @"endAddress";
NSString *const TOListDataManagerIDKey = @"id";

@interface TOListDataManager()

@end

@implementation TOListDataManager

- (void)loadData:(void(^)(NSArray *taxiOrders))completionHandler {

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:TOListDataManagerServerAddress]];

    void (^pFunction)(NSData *, NSURLResponse *, NSError *)=^(NSData *data, NSURLResponse *response, NSError *error) {

        NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                 options:NSJSONReadingAllowFragments
                                                                                   error:NULL];

        NSLog(@"json = %@", json);


        NSMutableArray *orders = [[NSMutableArray alloc] init];

        for (NSDictionary *dictionary in json) {

            TOTaxiOrder *taxiOrder = [[TOTaxiOrder alloc] init];

            //get start and end address
            TOAddress *startAddress = [[TOAddress alloc] initWithDictionary:dictionary[TOListDataManagerStartAddressKey]];
            TOAddress *endAddress = [[TOAddress alloc] initWithDictionary:dictionary[TOListDataManagerEndAddressKey]];


            taxiOrder.endAddress = endAddress;
            taxiOrder.startAddress = startAddress;
            taxiOrder.id = [dictionary[TOListDataManagerIDKey] unsignedIntegerValue];

            [orders addObject:taxiOrder];

        }


        //call completion

        completionHandler(orders);


    };
    NSURLSessionDataTask *sessionDataTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest
                                                                            completionHandler:pFunction];
    [sessionDataTask resume];

}


@end