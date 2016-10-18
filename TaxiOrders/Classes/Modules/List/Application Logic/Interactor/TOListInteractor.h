//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOCacheImageManagerOutput.h"
#import "TOListOrderOutput.h"

@class TOListOrdersManager;

@protocol TOListInteractorOutput, TOListInteractorInput;

@interface TOListInteractor : NSObject <TOListInteractorInput, TOCacheImageManagerOutput, TOListOrderOutput>

@property (nonatomic, strong) id <TOListInteractorOutput> output;

@end