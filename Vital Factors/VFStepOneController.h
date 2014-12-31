//
//  VFStepOneController.h
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFStepTwoController.h"

@interface VFStepOneController : UIViewController <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIButton *agentButton, *dbaButton, *businessButton, *dualButton, *streetButton, *cityButton, *stateButton, *zipButton;
    
    IBOutlet UIPickerView *brandPicker;
    
    NSString *agentString, *dbaString, *businessString, *dualString, *streetString, *cityString, *stateString, *zipString, *brandString;
    
    NSMutableArray *brandArray;
    
    BOOL isComplete;
    
    NSInteger whichAction;
    
}

- (IBAction)continueButton:(UIBarButtonItem *)sender;

- (IBAction)doAction:(UIButton *)sender;

@end
