//
//  TOListViewController.h
//  TaxiOrders
//
//  Created by Igor on 16/10/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListViewInterface.h"

@protocol TOListModuleInterface;

@interface TOListViewController : UIViewController <TOListViewInterface>

@property (nonatomic, strong) id<TOListModuleInterface> eventHandler;

@end
