//
//  TODetailViewController.m
//  TaxiOrders
//
//  Created by Igor on 18/10/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TODetailViewController.h"
#import "TOListDisplayTaxiOrdersItem.h"
#import "TOVehicle.h"
#import "TOPrice.h"

@interface TODetailViewController ()

@property (nonatomic, strong) TOListDisplayTaxiOrdersItem *item;

@property (nonatomic, weak) IBOutlet UIImageView *orderVehicleImageView;
@property (nonatomic, weak) IBOutlet UILabel *driverNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@end

@implementation TODetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setEdgesForExtendedLayout:UIRectEdgeTop];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateUI];
}

- (void)updateUI {

    TOVehicle *vehicle = self.item.taxiOrder.vehicle;
    self.orderVehicleImageView.image = vehicle.vehicleImage;
    
    self.driverNameLabel.text = vehicle.driverName;
    self.dateLabel.text = [[self.item taxiOrder] dateDescription];
    self.priceLabel.text = [self.item.taxiOrder.price description];
    
}

- (void)updateWithItem:(TOListDisplayTaxiOrdersItem *)item {
    self.item = item;
}

- (IBAction)actionBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
