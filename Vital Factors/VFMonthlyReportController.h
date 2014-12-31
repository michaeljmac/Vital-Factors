//
//  VFMonthlyReportController.h
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFMonthlyReportController : UIViewController <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIButton *staffInfo;
    
    IBOutlet UILabel *goal, *actual, *achieved, *last, *yearOverYear;
    
    IBOutlet UIImageView *goalImage, *lastImage;
    
    IBOutlet UIButton *prevMonth, *nextMonth, *vfChange, *monthChange;
    
    IBOutlet UIImageView *achievedImage, *yoyImage;
    
    IBOutlet UIPickerView *thePicker;
    
    IBOutlet UIBarButtonItem *yearButton;
    
    IBOutlet UILabel *vf1NameLabel, *vf2NameLabel, *vf3NameLabel, *vf4NameLabel, *vf5NameLabel;
    
    NSMutableArray *goalVF1, *actualVF1, *lastYearVF1;
    NSMutableArray *goalVF2, *actualVF2, *lastYearVF2;
    NSMutableArray *goalVF3, *actualVF3, *lastYearVF3;
    NSMutableArray *goalVF4, *actualVF4, *lastYearVF4;
    NSMutableArray *goalVF5, *actualVF5, *lastYearVF5;
    
    BOOL isFour, isFive;
    
    NSString *firstName, *lastName, *positionTitle, *regionName, *reportYear, *monthName;
    
    NSInteger currentMonth, currentVF, currentYear, staffNumber, whichRight, whichPicker;
    
    NSMutableArray *theMonths, *thePickerArray, *theTerritories, *theTerritoryNumbers;
    
    NSMutableArray *theRegions, *theRegionNumbers;
    
    NSString *vfName1, *vfName2, *vfName3, *vfName4, *vfName5;
    
}

- (void)createStartupForStaff:(NSInteger)whichOne month:(NSInteger)whichMonth vf:(NSInteger)whichVF territories:(NSArray *)territoryArray numbers:(NSArray *)numberArray;

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear;

- (IBAction)changeMonth:(UIButton *)sender;

- (IBAction)changeVF:(UIButton *)sender;

- (IBAction)changeYear:(UIBarButtonItem *)sender;

- (IBAction)changeTerritory:(UIButton *)sender;

- (void)resetData;

@end
