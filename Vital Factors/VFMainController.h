//
//  VFMainController.h
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFMonthlyReportController.h"

@interface VFMainController : UIViewController <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIButton *monthButton, *regionButton, *vf1Button, *vf2Button, *vf3Button, *vf4Button, *vf5Button, *graphButton;
    
    IBOutlet UIImageView *vf1Image, *vf2Image, *vf3Image, *vf4Image, *vf5Image;
    
    IBOutlet UIPickerView *thePicker;
    
    IBOutlet UILabel *vf1Percent, *vf2Percent, *vf3Percent, *vf4Percent, *vf5Percent, *vf1NameLabel, *vf2NameLabel, *vf3NameLabel, *vf4NameLabel, *vf5NameLabel;
    
    IBOutlet UIImageView *vf1Bar, *vf2Bar, *vf3Bar, *vf4Bar, *vf5Bar;
    
    IBOutlet UIView *graphView;
    
    NSMutableArray *theMonths, *theRegions, *theRegionNumbers, *pickerArray;
    
    NSInteger detailNumber, whichPicker, whichRow, whichView;
    
    IBOutlet UIBarButtonItem *doneButton;
    IBOutlet UIBarButtonItem *passwordButton;
    
    NSMutableArray *goalVF1, *actualVF1, *lastYearVF1;
    NSMutableArray *goalVF2, *actualVF2, *lastYearVF2;
    NSMutableArray *goalVF3, *actualVF3, *lastYearVF3;
    NSMutableArray *goalVF4, *actualVF4, *lastYearVF4;
    NSMutableArray *goalVF5, *actualVF5, *lastYearVF5;
    
    NSString *firstName, *lastName, *positionTitle, *regionName, *reportYear, *monthName;
    
    NSString *vfName1, *vfName2, *vfName3, *vfName4, *vfName5;
    
    NSInteger currentMonth, currentYear, currentRegion, currentRegionNumber, whichRight;
    
    BOOL isFour, isFive;
    
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *passwordButton;

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear;

- (IBAction)changeMonth:(UIButton *)sender;
- (IBAction)changeRegion:(UIButton *)sender;
- (IBAction)seeDetail:(UIButton *)sender;

- (IBAction)showGraph:(UIButton *)sender;

- (BOOL)checkInternet;

- (IBAction)finishedChoosing:(UIBarButtonItem *)sender;
- (IBAction)passwordButton:(UIBarButtonItem *)sender;



@end
