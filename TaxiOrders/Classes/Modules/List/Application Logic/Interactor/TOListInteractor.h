//
// Created by Igor on 16/10/16.
// Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TOListDataManager;

@protocol TOListInteractorOutput, TOListInteractorInput;

@interface TOListInteractor : NSObject <TOListInteractorInput>

- (instancetype)initWithDataManager:(TOListDataManager *)listDataManager;

@property (nonatomic, strong) id <TOListInteractorOutput> output;

@end