//
//  VFFormController.m
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFFormController.h"

@interface VFFormController ()

@end

@implementation VFFormController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)priceCalculation:(UIButton *)sender {
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Future Item" message:@"This will be functional in a future version." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [theAlert show];
    
}

- (IBAction)wireAgreement:(UIButton *)sender {
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Would you like to start a wire agreement?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        
        [self performSegueWithIdentifier:@"startToAgreement" sender:self];
        
    }
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
