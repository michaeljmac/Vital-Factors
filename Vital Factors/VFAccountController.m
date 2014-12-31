//
//  VFAccountController.m
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFAccountController.h"

@interface VFAccountController ()

@end

@implementation VFAccountController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    
        // Custom initialization
    
    }
    
    return self;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    theCode = [[theInfo objectAtIndex:0] intValue];
    firstName.text = [theInfo objectAtIndex:1];
    lastName.text = [theInfo objectAtIndex:2];
    emailName.text = [theInfo objectAtIndex:3];
    territoryName.text = [theInfo objectAtIndex:4];
    passwordName.text = [theInfo objectAtIndex:5];
    passwordConfirm.text = [theInfo objectAtIndex:5];
    titleName.text = [theInfo objectAtIndex:6];
    
}

- (void)setUpWith:(NSArray *)theData {
    
    theInfo = [NSArray arrayWithArray:theData];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    [self.navigationController popViewControllerAnimated:TRUE];
    
}

- (IBAction)updateNow:(UIButton *)sender {
    
    NSString *theString, *theURLString;
    
    theURLString = [NSString stringWithFormat:@"http://www.myvitalfactors.com/sendAccount.php?submit=update&firstname=%@&lastname=%@&email=%@&password=%@&title=%@&id=%d",firstName.text,lastName.text,emailName.text,passwordName.text,titleName.text,theCode];
    
    theString = [NSString stringWithContentsOfURL:[NSURL URLWithString:theURLString] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    if ([theString isEqualToString:@"FALSE"]) {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"The account info update failed.  Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    } else if ([theString isEqualToString:@"TRUE"]) {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"The account info was updated." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    } else {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"There was a server error.  Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    }
    
}

- (IBAction)mainMenu:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
