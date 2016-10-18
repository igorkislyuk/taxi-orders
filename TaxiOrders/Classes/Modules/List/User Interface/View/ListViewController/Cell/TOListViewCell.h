//
//  TOListViewCell.h
//  TaxiOrders
//
//  Created by Igor on 17/10/16.
//  Copyright (c) 2016 Igor Kislyuk. All rights reserved.
//

@interface TOListViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *cityFromNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressFromNameLabel;

@property (nonatomic, weak) IBOutlet UILabel *cityToNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressToNameLabel;

@end
