//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TOCacheImageManagerOutput <NSObject>

@required
- (void)image:(UIImage *)image didLoadForOrderID:(NSUInteger)orderID;

@end