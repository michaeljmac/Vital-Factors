//
//  VFStepTwoController.m
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepTwoController.h"

@interface VFStepTwoController ()

@end

@implementation VFStepTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    agreementString = @"";
    branchesString = @"";
    paymentsString = @"";
    durationString = @"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compileData:(NSArray *)theData {
    
    stepOneArray = [NSArray arrayWithArray:theData];
    
}

- (IBAction)doAction:(UIButton *)sender {
    
    UIAlertView *theAlert;
    
    whichAction = sender.tag;
    
    if (sender.tag == 101) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Agreement Type" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Exclusive", @"Premier", nil];
        
    } else if (sender.tag == 102) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Number of Branches" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"1", @"2", @"3", @"4", @"5", nil];
        
    } else if (sender.tag == 103) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Agreement Payment Plan" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Exclusive (6 Payments)", @"Premier (5 Payments)", nil];
        
    } else if (sender.tag == 104) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Agreement Contract Duration" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Exclusive (60 months)", @"Premier (36 months)", nil];
        
    }
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex > 0) {
        
        if (whichAction == 101) {
            
            if (buttonIndex == 1) {
                
                [agreementButton setTitle:@"Exclusive" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Exclusive (6 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Exclusive (60 months)" forState:UIControlStateNormal];
                
                agreementString = @"Exclusive";
                
                paymentsString = @"Exclusive";
                
                durationString = @"Exclusive";
                
            } else if (buttonIndex == 2) {
                
                [agreementButton setTitle:@"Premier" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Premier (5 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Premier (36 months)" forState:UIControlStateNormal];
                
                agreementString = @"Premier";
                
                paymentsString = @"Premier";
                
                durationString = @"Premier";
                
            }
            
        } else if (whichAction == 102) {
            
            if ((buttonIndex > 0) && (buttonIndex < 6)) {
                
                branchesString = [NSString stringWithFormat:@"%ld",(long)buttonIndex];
                
                [branchesButton setTitle:branchesString forState:UIControlStateNormal];
                
            }
            
        } else if (whichAction == 103) {
            
            if (buttonIndex == 1) {
                
                [agreementButton setTitle:@"Exclusive" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Exclusive (6 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Exclusive (60 months)" forState:UIControlStateNormal];
                
                agreementString = @"Exclusive";
                
                paymentsString = @"Exclusive";
                
                durationString = @"Exclusive";
                
            } else if (buttonIndex == 2) {
                
                [agreementButton setTitle:@"Premier" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Premier (5 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Premier (36 months)" forState:UIControlStateNormal];
                
                agreementString = @"Premier";
                
                paymentsString = @"Premier";
                
                durationString = @"Premier";
                
            }
            
        } else if (whichAction == 104) {
            
            if (buttonIndex == 1) {
                
                [agreementButton setTitle:@"Exclusive" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Exclusive (6 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Exclusive (60 months)" forState:UIControlStateNormal];
                
                agreementString = @"Exclusive";
                
                paymentsString = @"Exclusive";
                
                durationString = @"Exclusive";
                
            } else if (buttonIndex == 2) {
                
                [agreementButton setTitle:@"Premier" forState:UIControlStateNormal];
                
                [paymentsButton setTitle:@"Premier (5 payments)" forState:UIControlStateNormal];
                
                [durationButton setTitle:@"Premier (36 months)" forState:UIControlStateNormal];
                
                agreementString = @"Premier";
                
                paymentsString = @"Premier";
                
                durationString = @"Premier";
                
            }
            
        }
        
    }
    
    if ([agreementString isEqualToString:@""] || [branchesString isEqualToString:@""] || [paymentsString isEqualToString:@""] || [durationString isEqualToString:@""]) {
        
        isComplete = FALSE;
        
    } else {
        
        isComplete = TRUE;
        
    }
    
    whichAction = 0;
    
}

- (IBAction)dateChanged:(UIDatePicker *)sender {
    
    NSDate *newDate;
    
    newDate = [[sender date] dateByAddingTimeInterval:60*60*24*365*5];
    
    signedString = [sender date].description;
    
    expirationLabel.text = newDate.description;
    
}

- (IBAction)continueButton:(UIBarButtonItem *)sender {
    
    if (isComplete) {
        
        [self performSegueWithIdentifier:@"stepTwoToStepThree" sender:self];
        
    } else {
        
        whichAction = 0;
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"You must enter data for all fields to continue" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    VFStepThreeController *theController;
    
    NSMutableArray *theArray;
    
    theArray = [NSMutableArray arrayWithArray:stepOneArray];
    
    [theArray addObject:agreementString];
    [theArray addObject:branchesString];
    [theArray addObject:paymentsString];
    [theArray addObject:durationString];
    [theArray addObject:[signedPicker date]];
    
    theController = [segue destinationViewController];
    
    [theController compileData:theArray];
    
}


@end
