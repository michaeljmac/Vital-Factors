//
//  VFViewController.h
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFStaffTableController.h"
#import "VFMainController.h"
#import "VFMonthlyReportController.h"
#import <MessageUI/MessageUI.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface VFViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate> {
    
    IBOutlet UIBarButtonItem *loginButton;
    
    IBOutlet UITextField *emailField, *passwordField, *code1, *code2, *code3, *code4;
    
    IBOutlet UIButton *mainLogin;
    
    IBOutlet UIImageView *logoView;
    
    BOOL isLoggedIn;
    
    int whichAlert;
    
    IBOutlet UIButton *monthButton, *yearButton, *changePassword, *accountButton, *summaryButton;
    
    IBOutlet UILabel *topLabel;
    
}

- (IBAction)logging:(UIBarButtonItem *)sender;

- (void)userSetup:(BOOL)valid;

- (IBAction)passwordButton:(UIButton *)sender;

- (IBAction)doLogin:(UIButton *)sender;

- (void)setNextResponder:(UITextField *)nextOne;

- (BOOL)checkInternet;

@end
