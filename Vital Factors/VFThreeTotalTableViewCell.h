//
//  VFThreeTotalTableViewCell.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFThreeTotalTableViewCell : UITableViewCell {
    
    IBOutlet UILabel *wireExistingTotal, *wireNewTotal;
    
}

@property (nonatomic, strong) IBOutlet UILabel *wireExistingTotal;
@property (nonatomic, strong) IBOutlet UILabel *wireNewTotal;

@end
