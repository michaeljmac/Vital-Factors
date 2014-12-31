//
//  VFFourDataTableViewCell.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFFourDataTableViewCell : UITableViewCell {
    
    IBOutlet UILabel *numberLabel, *percentLabel, *dateLabel, *amountLabel, *wiresNewLabel, *wiresTotalLabel;
    
}

@property (nonatomic, strong) IBOutlet UILabel *numberLabel;
@property (nonatomic, strong) IBOutlet UILabel *percentLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) IBOutlet UILabel *wiresNewLabel;
@property (nonatomic, strong) IBOutlet UILabel *wiresTotalLabel;

@end
