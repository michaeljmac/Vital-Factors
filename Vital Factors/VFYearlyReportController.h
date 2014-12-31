//
//  VFYearlyReportController.h
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFYearlyReportController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate> {
    
    IBOutlet UICollectionView *theReport;
    
    IBOutlet UILabel *vfNumber, *vfTitle, *staffInfo;
    
    NSInteger whichStaff, currentVF, currentMonth, currentYear;
    
    NSMutableArray *theMonths;
    
    NSMutableArray *goalVF1, *actualVF1, *lastYearVF1;
    NSMutableArray *goalVF2, *actualVF2, *lastYearVF2;
    NSMutableArray *goalVF3, *actualVF3, *lastYearVF3;
    NSMutableArray *goalVF4, *actualVF4, *lastYearVF4;
    
    NSString *firstName, *lastName, *positionTitle, *regionName, *reportYear, *monthName;
    
    NSMutableArray *collectionArray;
    
}

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear;

- (IBAction)changeVF:(UIButton *)sender;

- (IBAction)changeYear:(UIBarButtonItem *)sender;

- (void)resetData;

@end
