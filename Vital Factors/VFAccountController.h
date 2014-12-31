//
//  VFAccountController.h
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFAccountController : UIViewController <UIAlertViewDelegate> {
    
    IBOutlet UITextField *firstName, *lastName, *titleName, *emailName, *passwordName, *passwordConfirm;
    
    IBOutlet UILabel *territoryName;
    
    IBOutlet UIButton *updateButton;
    
    NSArray *theInfo;
    
    int theCode;
    
}

- (void)setUpWith:(NSArray *)theData;

- (IBAction)updateNow:(UIButton *)sender;

- (IBAction)mainMenu:(UIBarButtonItem *)sender;

@end
