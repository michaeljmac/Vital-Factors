//
//  VFStepFiveController.h
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFStepSixController.h"

@interface VFStepFiveController : UIViewController {
    
    BOOL isComplete;
    
    UIView *signatureView;
    
    NSArray *allData;
    
}

- (void)compileData:(NSArray *)theData;

@end
