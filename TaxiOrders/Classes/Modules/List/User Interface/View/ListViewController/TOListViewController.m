//
//  TOListViewController.m
//  TaxiOrders
//
//  Created by Igor on 16/10/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

#import "TOListViewController.h"
#import "TOListModuleInterface.h"
#import "TOListViewCell.h"
#import "TOListDisplayTaxiOrdersData.h"
#import "TOListDisplayTaxiOrdersItem.h"
#import "TOAddress.h"

NSString *const TOListViewControllerReuseIdentifier = @"toListViewControllerReuseIdentifier";

@interface TOListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *noDataView;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) TOListDisplayTaxiOrdersData *data;

@end

@implementation TOListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setupTableView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupTableView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Taxi Orders";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if ([self.eventHandler shouldLoadData]) {
        
        [self.eventHandler startLoadData];
    }
}

#pragma mark - Helpers

- (void)setupTableView {
    if (self.tableView.dataSource == nil) {
        NSLog(@"Warning. Data Source is empty");
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 120.f;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TOListViewCell class])
                                               bundle:nil] forCellReuseIdentifier:TOListViewControllerReuseIdentifier];
}

- (void)reloadItems {
    [self.tableView reloadData];
}

#pragma mark - TOListViewInterface

- (void)showNoData {
    self.view = self.noDataView;
}

- (void)showTaxiOrders:(TOListDisplayTaxiOrdersData *)data {

    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }

        strongSelf.view = strongSelf.tableView;
        
        [strongSelf setupTableView];

        strongSelf.data = data;

        [strongSelf reloadItems];
    });
}

- (void)updateTaxiOrder:(TOListDisplayTaxiOrdersItem *)item {

    [self.data updateWithOrder:item];

    [self reloadItems];

}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TOListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TOListViewControllerReuseIdentifier
                                                           forIndexPath:indexPath];

    TOListDisplayTaxiOrdersItem *taxiOrdersItem = [[self.data items] objectAtIndex:indexPath.item];

    TOAddress *startAddress = taxiOrdersItem.taxiOrder.startAddress;
    TOAddress *endAddress = taxiOrdersItem.taxiOrder.endAddress;

    cell.cityToNameLabel.text = startAddress.cityString;
    cell.addressToNameLabel.text = startAddress.addressString;

    cell.cityFromNameLabel.text = endAddress.cityString;
    cell.addressFromNameLabel.text = endAddress.addressString;

    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //pass data and show image
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    TOListDisplayTaxiOrdersItem *item = [[self.data items] objectAtIndex:indexPath.item];

    [self.eventHandler showOrderDetail:item];

}

@end
