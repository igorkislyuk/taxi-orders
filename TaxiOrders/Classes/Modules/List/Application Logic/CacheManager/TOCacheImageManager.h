//
// Created by Igor on 18/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TOCacheImageManagerOutput;

@interface TOCacheImageManager : NSObject

- (void)getImagesForOrders:(NSArray *)orders;

@property (nonatomic, weak) id <TOCacheImageManagerOutput> output;

@end