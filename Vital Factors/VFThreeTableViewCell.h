//
//  VFThreeTableViewCell.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFThreeTableViewCell : UITableViewCell {
    
    IBOutlet UIButton *agentButton, *wireExistingButton, *wireNewButton;
    
}

@property (nonatomic, strong) IBOutlet UIButton *agentButton;
@property (nonatomic, strong) IBOutlet UIButton *wireExistingButton;
@property (nonatomic, strong) IBOutlet UIButton *wireNewButton;

@end
