//
//  VFThreeBonusTableViewCell.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFThreeBonusTableViewCell : UITableViewCell {
    
    IBOutlet UIButton *wireExistingBonus, *wireNewBonus;
    
}

@property (nonatomic, strong) IBOutlet UIButton *wireExistingBonus;
@property (nonatomic, strong) IBOutlet UIButton *wireNewBonus;

@end
