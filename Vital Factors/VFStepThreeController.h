//
//  VFStepThreeController.h
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFThreeTableViewCell.h"
#import "VFThreeTotalTableViewCell.h"
#import "VFThreeBonusTableViewCell.h"
#import "VFStepFourController.h"

@interface VFStepThreeController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    
    NSArray *allData;
    
    NSMutableArray *countryArray, *agentArray, *existingArray, *newArray, *existingTotalArray, *newTotalArray, *existingBonusArray, *newBonusArray;
    
    IBOutlet UITableView *dataTable;
    
    NSInteger whichAlert, commonRow, commonSection;
    
    BOOL isAgent, isExisting, isNew, isEBonus, isNBonus, isComplete;
    
}

- (void)compileData:(NSArray *)theData;

- (IBAction)changeAgentID:(UIButton *)sender;
- (IBAction)changeExistingWires:(UIButton *)sender;
- (IBAction)changeNewWires:(UIButton *)sender;

- (IBAction)changeExistingBonus:(UIButton *)sender;
- (IBAction)changeNewBonus:(UIButton *)sender;

- (IBAction)addCountry:(UIButton *)sender;

@end
