//
//  VFStepTwoController.h
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFStepThreeController.h"

@interface VFStepTwoController : UIViewController <UIAlertViewDelegate> {
    
    NSArray *stepOneArray;
    
    IBOutlet UIButton *agreementButton, *branchesButton, *paymentsButton, *durationButton;
    
    IBOutlet UIDatePicker *signedPicker;
    
    IBOutlet UILabel *expirationLabel;
    
    NSString *agreementString, *branchesString, *paymentsString, *durationString, *signedString, *expirationString;
    
    NSInteger whichAction;
    
    BOOL isComplete;
    
}

- (void)compileData:(NSArray *)theData;

- (IBAction)doAction:(UIButton *)sender;

- (IBAction)dateChanged:(UIDatePicker *)sender;

- (IBAction)continueButton:(UIBarButtonItem *)sender;

@end
