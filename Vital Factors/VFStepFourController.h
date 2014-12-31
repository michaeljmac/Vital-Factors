//
//  VFStepFourController.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFFourDataTableViewCell.h"
#import "VFFourHeaderTableViewCell.h"
#import "VFFourTotalTableViewCell.h"
#import "VFStepFiveController.h"

@interface VFStepFourController : UIViewController <UITabBarControllerDelegate, UITableViewDataSource> {
    
    NSMutableArray *numberArray, *percentArray, *dateArray, *amountArray, *wiresArray, *totalArray;
    
    BOOL isComplete;
    
    NSArray *allData;
    
    IBOutlet UITableView *theTable;
    
    NSInteger agreementAmount;
    
}

- (void)compileData:(NSArray *)theData;

- (IBAction)continueButton:(UIBarButtonItem *)sender;

@end
