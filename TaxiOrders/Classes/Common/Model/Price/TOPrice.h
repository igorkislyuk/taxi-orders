//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TOPrice : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)json;

@property (nonatomic, readonly, copy) NSString *currency;

@property (nonatomic, readonly, assign) NSUInteger unitPart;
@property (nonatomic, readonly, assign) NSUInteger fractionalPart;

@end