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
#import "TODisplayTaxiOrdersData.h"
#import "TODisplayTaxiOrdersItem.h"

NSString *const TOListViewControllerReuseIdentifier = @"toListViewControllerReuseIdentifier";

@interface TOListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *noDataView;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) TODisplayTaxiOrdersData *data;

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


}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.eventHandler startLoadData];
}

#pragma mark - Helpers

- (void)setupTableView {
    if (self.tableView.dataSource == nil) {
        NSLog(@"Warning");
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

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

- (void)showTaxiOrders:(TODisplayTaxiOrdersData *)data {

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

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TOListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TOListViewControllerReuseIdentifier
                                                           forIndexPath:indexPath];

    TODisplayTaxiOrdersItem *taxiOrdersItem = [[self.data items] objectAtIndex:indexPath.item];

    cell.cityNameLabel.text = taxiOrdersItem.cityString;

    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
