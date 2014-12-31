//
//  VFFormController.h
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFFormController : UIViewController <UIAlertViewDelegate> {
    
    IBOutlet UIButton *thePriceButton;
    
    IBOutlet UIButton *theAgreementButton;
    
}

- (IBAction)priceCalculation:(UIButton *)sender;

- (IBAction)wireAgreement:(UIButton *)sender;

@end
