//
//  VFStepOneController.m
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepOneController.h"

@interface VFStepOneController ()

@end

@implementation VFStepOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    brandArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    [brandArray addObject:@"Brand One"];
    [brandArray addObject:@"Brand Two"];
    [brandArray addObject:@"Brand Three"];
    [brandArray addObject:@"Brand Four"];
    [brandArray addObject:@"Brand Five"];
    
    brandString = [brandArray objectAtIndex:0];
    
    isComplete = FALSE;
    
    agentString = @"";
    dbaString = @"";
    businessString = @"";
    dualString = @"";
    streetString = @"";
    cityString = @"";
    stateString = @"";
    zipString = @"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)continueButton:(UIBarButtonItem *)sender {
    
    if (isComplete) {
        
        [self performSegueWithIdentifier:@"stepOneToStepTwo" sender:self];
        
    } else {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"You must enter data for the fields to continue" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    }
    
}

- (IBAction)doAction:(UIButton *)sender {
    
    UIAlertView *theAlert;
    
    whichAction = sender.tag;
    
    if (sender.tag == 101) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Agent ID" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
        
    } else if (sender.tag == 102) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"DBA Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
        
    } else if (sender.tag == 103) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Business Owner" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
        
    } else if (sender.tag == 104) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Dual Agent ID" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
        
    } else if (sender.tag == 105) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Street Address" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
        
    } else if (sender.tag == 106) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"City" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
        
    } else if (sender.tag == 107) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"State" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].autocapitalizationType = UITextAutocapitalizationTypeWords;
        
    } else if (sender.tag == 108) {
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Zip" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        
        [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
        
    }
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (whichAction == 101) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [agentButton setTitle:@"Agent ID" forState:UIControlStateNormal];
            
            agentString = @"";
            
        } else {
            
            [agentButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            agentString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 102) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [dbaButton setTitle:@"DBA Name" forState:UIControlStateNormal];
            
            dbaString = @"";
            
        } else {
            
            [dbaButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            dbaString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 103) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [businessButton setTitle:@"Business Name" forState:UIControlStateNormal];
            
            businessString = @"";
            
        } else {
            
            [businessButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            businessString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 104) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [dualButton setTitle:@"Dual Agent ID" forState:UIControlStateNormal];
            
            dualString = @"";
            
        } else {
            
            [dualButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            dualString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 105) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [streetButton setTitle:@"Street Address" forState:UIControlStateNormal];
            
            streetString = @"";
            
        } else {
            
            [streetButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            streetString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 106) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [cityButton setTitle:@"City" forState:UIControlStateNormal];
            
            cityString = @"";
            
        } else {
            
            [cityButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            cityString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 107) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [stateButton setTitle:@"State" forState:UIControlStateNormal];
            
            stateString = @"";
            
        } else {
            
            [stateButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            stateString = [alertView textFieldAtIndex:0].text;
            
        }
        
    } else if (whichAction == 108) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            
            [zipButton setTitle:@"Zip Code" forState:UIControlStateNormal];
            
            zipString = @"";
            
        } else {
            
            [zipButton setTitle:[alertView textFieldAtIndex:0].text forState:UIControlStateNormal];
            
            
            zipString = [alertView textFieldAtIndex:0].text;
        }
        
        if ([agentString isEqualToString:@""] || [dbaString isEqualToString:@""] || [businessString isEqualToString:@""] || [dualString isEqualToString:@""] || [streetString isEqualToString:@""] || [cityString isEqualToString:@""] || [stateString isEqualToString:@""] || [zipString isEqualToString:@""]) {
            
            isComplete = FALSE;
            
        } else {
            
            isComplete = TRUE;
            
        }
        
    }
    
    whichAction = 0;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    brandString = [brandArray objectAtIndex:row];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [brandArray objectAtIndex:row];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 5;
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSArray *theArray;
    
    theArray = [NSArray arrayWithObjects:agentString, dbaString, businessString, dualString, streetString, cityString, stateString, zipString, brandString, nil];
    
    VFStepTwoController *theController;
    
    theController = [segue destinationViewController];
    
    [theController compileData:theArray];

}

@end
