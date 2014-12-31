//
//  VFViewController.m
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import "VFViewController.h"

@interface VFViewController ()

@end

@implementation VFViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [code1 setKeyboardType:UIKeyboardTypeDecimalPad];
    [code2 setKeyboardType:UIKeyboardTypeDecimalPad];
    [code3 setKeyboardType:UIKeyboardTypeDecimalPad];
    [code4 setKeyboardType:UIKeyboardTypeDecimalPad];
    
    whichAlert = 0;
    
    self.navigationItem.rightBarButtonItem = nil;

}

- (void)viewWillAppear:(BOOL)animated {
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"accesscode"] > 999) {
        
        code1.hidden = FALSE;
        code2.hidden = FALSE;
        code3.hidden = FALSE;
        code4.hidden = FALSE;
        
        code1.text = @"";
        code2.text = @"";
        code3.text = @"";
        code4.text = @"";
        
        emailField.hidden = TRUE;
        passwordField.hidden = TRUE;
        
        emailField.text = @"";
        passwordField.text = @"";
        
        [mainLogin setTitle:@"Continue" forState:UIControlStateNormal];
        
        [code1 becomeFirstResponder];
        
    } else {
        
        code1.hidden = TRUE;
        code2.hidden = TRUE;
        code3.hidden = TRUE;
        code4.hidden = TRUE;
        
        code1.text = @"";
        code2.text = @"";
        code3.text = @"";
        code4.text = @"";
        
        emailField.hidden = FALSE;
        passwordField.hidden = FALSE;
        
        emailField.text = @"";
        passwordField.text = @"";
        
        mainLogin.hidden = FALSE;
        
        logoView.hidden = FALSE;
        
        [mainLogin setTitle:@"Login" forState:UIControlStateNormal];
        
        [emailField becomeFirstResponder];
        
    }
    
    monthButton.hidden = TRUE;
    yearButton.hidden = TRUE;
    changePassword.hidden = TRUE;
    summaryButton.hidden = TRUE;
    
    accountButton.hidden = TRUE;
    
    if (![self checkInternet]) {
        
        whichAlert = 7;
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There is a problem with contacting the host.  Check your internet settings or call your administrator." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
        [mainLogin setTitle:@"Check Again" forState:UIControlStateNormal];
        
    }
    
}

- (BOOL)checkInternet {
    
    NSString *testString;
    
    testString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.myvitalfactors.com"] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    if (testString == nil) {
        
        return FALSE;
        
    } else {
        
        return TRUE;
        
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ( (textField == emailField) || (textField == passwordField) ) {
        
        return TRUE;
        
    } else {
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        
        if (newLength > 1) {
            
            if (textField == code1) {
                
                [code2 becomeFirstResponder];
                
            } else if (textField == code2) {
                
                [code3 becomeFirstResponder];
                
                
            } else if (textField == code3) {
                
                [code4 becomeFirstResponder];
                
            } else if (textField == code4) {
                
                [code1 becomeFirstResponder];
                
            }
            
            return FALSE;
            
        } else if (newLength > 0) {
            
            if (textField == code1) {
                
                [self performSelector:@selector(setNextResponder:) withObject:code2 afterDelay:0.2];
                
            } else if (textField == code2) {
                
                [self performSelector:@selector(setNextResponder:) withObject:code3 afterDelay:0.2];
                
                
            } else if (textField == code3) {
                
                [self performSelector:@selector(setNextResponder:) withObject:code4 afterDelay:0.2];
                
            } else if (textField == code4) {
                
                [self performSelector:@selector(setNextResponder:) withObject:code1 afterDelay:0.2];
                
            }
            
            return TRUE;
            
        } else {
            
            return TRUE;
            
        }
        
    }
    
}

- (void)setNextResponder:(UITextField *)nextOne {
    
    [nextOne becomeFirstResponder];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [emailField resignFirstResponder];
    
    [passwordField resignFirstResponder];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mainToStaff"]) {
        
        VFStaffTableController *theController;
        
        theController = [segue destinationViewController];
        
        [theController setUpArrays];
        
    } else if ([segue.identifier isEqualToString:@"mainToMain"]) {
        
        //VFMainController *theController;
        
        //theController = [segue destinationViewController];
        
        //if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] > 1000) {
            
            //[theController getDataFromStaff:0 andYear:2013];
            
        //} else {
            
            //[theController getDataFromStaff:[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] andYear:2013];
            
        //}
        
    } else if ([segue.identifier isEqualToString:@"monthlyReport"]) {
        
        VFMonthlyReportController *theController;
        
        theController = [segue destinationViewController];
        
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] > 999) {
            
            [theController createStartupForStaff:0 month:-1 vf:-1 territories:[NSArray arrayWithObject:@"None"] numbers:[NSArray arrayWithObject:@"0"]];
            
        } else {
            
            [theController createStartupForStaff:[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] month:-1 vf:-1 territories:[NSArray arrayWithObject:@"None"] numbers:[NSArray arrayWithObject:@"0"]];
            
        }
        
    }
    
}

- (IBAction)passwordButton:(UIButton *)sender {
    
    whichAlert = 3;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Change Password" message:@"Enter Password and Confirm:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    [[theAlert textFieldAtIndex:0] setSecureTextEntry:TRUE];
    
    [theAlert textFieldAtIndex:0].placeholder = @"Password";
    [theAlert textFieldAtIndex:1].placeholder = @"Confirm Password";
    
    [theAlert show];
    
}

- (IBAction)doLogin:(UIButton *)sender {
    
    if ([self checkInternet]) {
        
        if ([[mainLogin currentTitle] isEqualToString:@"Login"]) {
            
            if ([emailField.text isEqualToString:@""] && [passwordField.text isEqualToString:@""]) {
                
                whichAlert = 0;
                
                UIAlertView *theAlert;
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must enter both email and password to login (leave password field blank to retrieve password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [theAlert show];
                
            } else if ([passwordField.text isEqualToString:@""]) {
                
                NSString *emailTitle = @"Forgot Password";
                // Email Content
                NSString *messageBody = [NSString stringWithFormat:@"Please reset and send me my password for %@",emailField.text];
                // To address
                NSArray *toRecipents = [NSArray arrayWithObject:@"salesMIS@sigue.com"];
                
                MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
                mc.mailComposeDelegate = self;
                [mc setSubject:emailTitle];
                [mc setMessageBody:messageBody isHTML:NO];
                [mc setToRecipients:toRecipents];
                
                // Present mail view controller on screen
                [self presentViewController:mc animated:YES completion:NULL];
                
            } else {
                
                NSString *wholeString, *logString;
                
                logString = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getUser.php?username=%@&password=%@",emailField.text,passwordField.text];
                
                wholeString = [NSString stringWithContentsOfURL:[NSURL URLWithString:logString] encoding:NSStringEncodingConversionAllowLossy error:nil];
                
                if ([[wholeString substringToIndex:5] isEqualToString:@"FALSE"]) {
                    
                    UIAlertView *theAlert;
                    
                    whichAlert = 0;
                    
                    theAlert = [[UIAlertView alloc] initWithTitle:@"Invalid" message:[NSString stringWithFormat:@"%@ %@",[wholeString substringFromIndex:8], @"Please try again."] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [self userSetup:FALSE];
                    
                    [theAlert show];
                    
                } else {
                    
                    whichAlert = 0;
                    
                    NSArray *theArray;
                    
                    theArray = [wholeString componentsSeparatedByString:@";"];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:3] forKey:@"username"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:5] forKey:@"password"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:1] forKey:@"firstname"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:2] forKey:@"lastname"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:4] forKey:@"region"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:6] forKey:@"title"];
                    [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:0] forKey:@"code"];
                    
                    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"loggedin"];
                    
                    whichAlert = 5;
                    
                    UIAlertView *theAlert;
                    
                    theAlert = [[UIAlertView alloc] initWithTitle:@"Save Login" message:@"Would you like to enter a code for faster login in the future?" delegate:self cancelButtonTitle:@"No, thanks." otherButtonTitles:@"Yes, please.", nil];
                    
                    [theAlert show];
                    
                }
                
            }
            
        } else if ([[mainLogin currentTitle] isEqualToString:@"Continue"]) {
            
            if ([code1.text isEqualToString:@""] || [code2.text isEqualToString:@""] || [code3.text isEqualToString:@""] || [code4.text isEqualToString:@""]) {
                
                whichAlert = 7;
                
                UIAlertView *theAlert;
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must enter a four digit code to go on." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [theAlert show];
                
            } else {
                
                NSString *theCode;
                
                NSInteger theIntegerCode;
                
                theCode = [NSString stringWithFormat:@"%@%@%@%@",code1.text,code2.text,code3.text,code4.text];
                
                theIntegerCode = [theCode integerValue];
                
                if ([[NSUserDefaults standardUserDefaults] integerForKey:@"accesscode"] == theIntegerCode) {
                    
                    [self userSetup:TRUE];
                    
                } else {
                    
                    whichAlert = 6;
                    
                    UIAlertView *theAlert;
                    
                    theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not the correct code.  Try again or login again?" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:@"Login Again",nil];
                    
                    [theAlert show];
                    
                }
                
            }
            
        } else if ([[mainLogin currentTitle] isEqualToString:@"Check Again"]) {
            
            if ([self checkInternet]) {
                
                [mainLogin setTitle:@"Login" forState:UIControlStateNormal];
                
            } else {
                
                whichAlert = 7;
                
                UIAlertView *theAlert;
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There is still a problem with contacting the host.  Check your internet settings or call your administrator." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [theAlert show];
                
            }
            
        } else {
            
            if ([code1.text isEqualToString:@""] || [code2.text isEqualToString:@""] || [code3.text isEqualToString:@""] || [code4.text isEqualToString:@""]) {
                
                whichAlert = 7;
                
                UIAlertView *theAlert;
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must enter a four digit code to go on." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [theAlert show];
                
            } else {
                
                NSString *theCode;
                
                NSInteger theIntegerCode;
                
                theCode = [NSString stringWithFormat:@"%@%@%@%@",code1.text,code2.text,code3.text,code4.text];
                
                theIntegerCode = [theCode integerValue];
                
                [[NSUserDefaults standardUserDefaults] setInteger:theIntegerCode forKey:@"accesscode"];
                
                [self userSetup:TRUE];
                
            }
            
        }
        
    } else {
        
        whichAlert = 7;
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There is a problem with contacting the host.  Check your internet settings or call your administrator." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
        [mainLogin setTitle:@"Check Again" forState:UIControlStateNormal];
        
    }
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    UIAlertView *theAlert;
    
    whichAlert = 0;
    
    switch (result) {
        case MFMailComposeResultCancelled:
            
            theAlert = [[UIAlertView alloc] initWithTitle:@"Cancelled" message:@"You canceled your password reminder email." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
            
        case MFMailComposeResultSaved:
           
            theAlert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"You saved your password reminder email to be sent later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
            
        case MFMailComposeResultSent:
            
            theAlert = [[UIAlertView alloc] initWithTitle:@"Sent" message:@"Your password reminder email was sent.  Check your email for a response soon." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
            
        case MFMailComposeResultFailed:
            
            theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Your password reminder email had a send failure: %@.  Please try again later.", [error localizedDescription]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
            
        default:
            
            theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error sending your password reminder email." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            break;
    
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    [theAlert show];
}

- (void)userSetup:(BOOL)valid {
    
    int mainCode;
    
    NSString *firstName, *regionName;
    
    mainCode = [[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue];
    firstName = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstname"];
    regionName = [[NSUserDefaults standardUserDefaults] objectForKey:@"region"];
    
    if (valid) {
        
        if (mainCode == 1001) {
            
            emailField.hidden = TRUE;
            passwordField.hidden = TRUE;
            mainLogin.hidden = TRUE;
            logoView.hidden = TRUE;
            code1.hidden = TRUE;
            code2.hidden = TRUE;
            code3.hidden = TRUE;
            code4.hidden = TRUE;
            
            [loginButton setTitle:@"Log Out"];
            
            monthButton.hidden = FALSE;
            yearButton.hidden = FALSE;
            changePassword.hidden = FALSE;
            summaryButton.hidden = FALSE;
            
            accountButton.hidden = FALSE;
            monthButton.hidden = TRUE;
            
            topLabel.text = [NSString stringWithFormat:@"Welcome, %@.  You may now use the app to view reports for %@.",firstName,regionName];
            
            [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"loggedin"];
            
            [passwordField resignFirstResponder];
            [emailField resignFirstResponder];
            
        } else {
            
            accountButton.hidden = TRUE;
            
            [self performSegueWithIdentifier:@"mainToMain" sender:self];
            
        }
        
    } else {
        
        [loginButton setTitle:@"Log in"];
        
        monthButton.hidden = TRUE;
        yearButton.hidden = TRUE;
        changePassword.hidden = TRUE;
        accountButton.hidden = TRUE;
        summaryButton.hidden = TRUE;
        
        topLabel.text = @"Please touch Login above to begin using App.";
        
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"loggedin"];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)logging:(UIBarButtonItem *)sender {
    
    UIAlertView *theAlert;
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loggedin"]) {
        
        whichAlert = 1;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Log Out" message:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"OK", nil];
        
    } else {
        
        whichAlert = 2;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Log In" message:@"Enter Email and Password Below" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Login", nil];
        
        theAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
        
    }
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    UIAlertView *theAlert;
    
    if (whichAlert == 1) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"loggedin"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"firstname"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastname"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"title"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"region"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"code"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"accesscode"];
        
        whichAlert = 0;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Complete" message:@"You are now logged out." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [self userSetup:FALSE];
        
    } else if (whichAlert == 2) {
        
        if (buttonIndex == 1) {
            
            NSString *wholeString, *logString;
            
            logString = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getUser.php?username=%@&password=%@",[alertView textFieldAtIndex:0].text,[alertView textFieldAtIndex:1].text];
            
            wholeString = [NSString stringWithContentsOfURL:[NSURL URLWithString:logString] encoding:NSStringEncodingConversionAllowLossy error:nil];
            
            if ([[wholeString substringToIndex:5] isEqualToString:@"FALSE"]) {
                
                whichAlert = 2;
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Invalid" message:[NSString stringWithFormat:@"%@ %@",[wholeString substringFromIndex:8], @"Please try again. Enter Email and Password Below."] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                
                theAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
                
                [self userSetup:FALSE];
                
                [theAlert show];
                
            } else {
                
                whichAlert = 0;
                
                NSArray *theArray;
                
                theArray = [wholeString componentsSeparatedByString:@";"];
                
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:3] forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:5] forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:1] forKey:@"firstname"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:2] forKey:@"lastname"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:4] forKey:@"region"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:6] forKey:@"title"];
                [[NSUserDefaults standardUserDefaults] setObject:[theArray objectAtIndex:0] forKey:@"code"];
                
                [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"loggedin"];
                
                [self userSetup:TRUE];
                
            }
            
        }
        
    } else if (whichAlert == 3) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:[alertView textFieldAtIndex:1].text]) {
            
            whichAlert = 0;
            
            UIAlertView *theAlert;
            
            NSString *setString, *finalString;
            
            setString = [NSString stringWithFormat:@"http://www.myvitalfactors.com/changePassword2.php?who=%d&password=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue],[alertView textFieldAtIndex:0].text];
            
            finalString = [NSString stringWithContentsOfURL:[NSURL URLWithString:setString] encoding:NSStringEncodingConversionAllowLossy error:nil];
            
            if ([finalString isEqualToString:@"FALSE"]) {
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error saving your password, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
            } else {
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your new password has been saved." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithString:[alertView textFieldAtIndex:0].text] forKey:@"password"];
                
            }
            
            [theAlert show];
            
        } else {
            
            whichAlert = 0;
            
            UIAlertView *theAlert;
            
            theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The passwords do not match, please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [theAlert show];
            
        }
        
    } else if (whichAlert == 4) {
        
        
        
    } else if (whichAlert == 5) {
        
        if (buttonIndex == 0) {
            
            [self userSetup:TRUE];
            
        } else {
            
            code1.hidden = FALSE;
            code2.hidden = FALSE;
            code3.hidden = FALSE;
            code4.hidden = FALSE;
            
            emailField.hidden = TRUE;
            passwordField.hidden = TRUE;
            
            [mainLogin setTitle:@"Set Code" forState:UIControlStateNormal];
            
            [code1 becomeFirstResponder];
            
        }
        
    } else if (whichAlert == 6) {
        
        if (buttonIndex == 0) {
            
            code1.text = @"";
            code2.text = @"";
            code3.text = @"";
            code4.text = @"";
            
            [code1 becomeFirstResponder];
            
        } else {
            
            code1.text = @"";
            code2.text = @"";
            code3.text = @"";
            code4.text = @"";
            
            code1.hidden = TRUE;
            code2.hidden = TRUE;
            code3.hidden = TRUE;
            code4.hidden = TRUE;
            
            emailField.hidden = FALSE;
            passwordField.hidden = FALSE;
            
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"accesscode"];
            
            [mainLogin setTitle:@"Login" forState:UIControlStateNormal];
            
            [emailField becomeFirstResponder];
            
        }
        
    }
    
}

@end
