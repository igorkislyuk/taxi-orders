//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOAddress : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)userInfo;

@property (readonly, nonatomic) NSString *addressString;

@property (readonly, nonatomic) NSString *cityString;

@end