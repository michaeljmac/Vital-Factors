//
//  VFStepSixController.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface VFStepSixController : UIViewController {
    
    BOOL isComplete;
    
    NSArray *allData;
    
    NSString *agreement1, *agreement2, *document1, *document2;
    
    NSAttributedString *final1, *final2;
    
    IBOutlet UIWebView *theView;
    
    IBOutlet UIButton *viewButton1, *viewButton2;
    
    BOOL isView1, isView2;
    
    NSMutableArray *numberArray, *percentArray, *dateArray, *amountArray, *wiresArray, *totalArray;
    
    NSInteger agreementAmount;
    
}

- (void)compileData:(NSArray *)theData;

- (IBAction)goHome:(UIButton *)sender;

- (IBAction)shareAgreement:(UIBarButtonItem *)sender;

- (IBAction)showDocument:(UIButton *)sender;

@end
