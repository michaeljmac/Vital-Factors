//
//  VFMonthlyReportController.m
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import "VFMonthlyReportController.h"

@interface VFMonthlyReportController ()

@end

@implementation VFMonthlyReportController

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
    
    thePickerArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    theMonths = [[NSMutableArray alloc] initWithCapacity:12];
    
    [theMonths addObject:@"January"];
    [theMonths addObject:@"February"];
    [theMonths addObject:@"March"];
    [theMonths addObject:@"April"];
    [theMonths addObject:@"May"];
    [theMonths addObject:@"June"];
    [theMonths addObject:@"July"];
    [theMonths addObject:@"August"];
    [theMonths addObject:@"September"];
    [theMonths addObject:@"October"];
    [theMonths addObject:@"November"];
    [theMonths addObject:@"December"];
    
    goalVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    
    currentYear = 2013;
    
    whichRight = 1;
    
    [self getDataFromStaff:staffNumber andYear:currentYear];
    
    if (currentMonth == -1) {
        
        currentMonth = [monthName intValue] - 1;
        
    }
    
    if (currentVF == -1) {
        
        currentVF = 1;
        
    }
    
    [yearButton setTitle:@""];
    
    [self resetData];
    
}

- (void)createStartupForStaff:(NSInteger)whichOne month:(NSInteger)whichMonth vf:(NSInteger)whichVF territories:(NSArray *)territoryArray numbers:(NSArray *)numberArray {
    
    staffNumber = whichOne;
    currentMonth = whichMonth;
    currentVF = whichVF;
    
    theTerritories = [NSMutableArray arrayWithArray:territoryArray];
    
    theTerritoryNumbers = [NSMutableArray arrayWithArray:numberArray];
    
}

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear {
    
    NSString *dataResponse, *dataResponse2, *textUrl, *textUrl2;
    
    goalVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF1 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF2 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF3 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF4 = [[NSMutableArray alloc] initWithCapacity:5];
    
    goalVF5 = [[NSMutableArray alloc] initWithCapacity:5];
    actualVF5 = [[NSMutableArray alloc] initWithCapacity:5];
    lastYearVF5 = [[NSMutableArray alloc] initWithCapacity:5];
    
    if (theNumber == 0) {
        
        textUrl = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getData.php?who=%d&when=%ld",1,(long)theYear];
        
    } else {
        
        textUrl = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getData.php?who=%ld&when=%ld",(long)theNumber,(long)theYear];
        
    }
    
    dataResponse = [NSString stringWithContentsOfURL:[NSURL URLWithString:textUrl] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    textUrl2 = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getTerritories.php?which=%ld",(long)theNumber];
    
    dataResponse2 = [NSString stringWithContentsOfURL:[NSURL URLWithString:textUrl2] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    if ([dataResponse isEqualToString:@"ERROR"]) {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was a data error, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    } else {
        
        int i;
        
        NSArray *theArray;
        
        theArray = [dataResponse componentsSeparatedByString:@";"];
        
        firstName = [theArray objectAtIndex:0];
        lastName = [theArray objectAtIndex:1];
        positionTitle = [theArray objectAtIndex:2];
        regionName = [theArray objectAtIndex:3];
        monthName = [theArray objectAtIndex:4];
        
        for (i=5; i<18; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF1 addObject:[theArray2 objectAtIndex:0]];
            [actualVF1 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF1 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        vfName1 = [theArray objectAtIndex:18];
        
        for (i=19; i<32; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF2 addObject:[theArray2 objectAtIndex:0]];
            [actualVF2 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF2 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        vfName2 = [theArray objectAtIndex:32];
        
        for (i=33; i<46; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF3 addObject:[theArray2 objectAtIndex:0]];
            [actualVF3 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF3 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        vfName3 = [theArray objectAtIndex:46];
        
        if ([theArray count] > 46) {
            
            for (i=47; i<60; i++) {
                
                NSArray *theArray2;
                
                theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
                
                [goalVF4 addObject:[theArray2 objectAtIndex:0]];
                [actualVF4 addObject:[theArray2 objectAtIndex:1]];
                [lastYearVF4 addObject:[theArray2 objectAtIndex:2]];
                
            }
            
            vfName4 = [theArray objectAtIndex:60];
            
            isFour = TRUE;
            
        } else {
            
            isFour = FALSE;
            
        }
        
        if ([theArray count] > 60) {
            
            for (i=61; i<74; i++) {
                
                NSArray *theArray2;
                
                theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
                
                [goalVF5 addObject:[theArray2 objectAtIndex:0]];
                [actualVF5 addObject:[theArray2 objectAtIndex:1]];
                [lastYearVF5 addObject:[theArray2 objectAtIndex:2]];
                
            }
            
            vfName5 = [theArray objectAtIndex:74];
            
            isFive = TRUE;
            
        } else {
            
            isFive = FALSE;
            
        }
        
        if (![dataResponse2 isEqualToString:@"FALSE"]) {
            
            if (theRegions == nil) {
                
                theRegions = [[NSMutableArray alloc] initWithCapacity:5];
                theRegionNumbers = [[NSMutableArray alloc] initWithCapacity:5];
                
                theArray = [dataResponse2 componentsSeparatedByString:@"::"];
                
                for (i=0; i<[theArray count]; i++) {
                    
                    NSArray *theArray2;
                    
                    theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@";;"];
                    
                    [theRegions addObject:[theArray2 objectAtIndex:0]];
                    [theRegionNumbers addObject:[theArray2 objectAtIndex:1]];
                    
                }
                
            }
            
        }
        
    }
    
}

- (void)resetData {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###,###"];
    
    if (currentVF == 1) {
        
        
        [vfChange setTitle:vfName1 forState:UIControlStateNormal];
        [staffInfo setTitle:[NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName] forState:UIControlStateNormal];
        
        monthName = [theMonths objectAtIndex:currentMonth];
        
        [monthChange setTitle:[NSString stringWithString:monthName] forState:UIControlStateNormal];
        
        goal.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[goalVF1 objectAtIndex:currentMonth] floatValue]]];
        actual.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[actualVF1 objectAtIndex:currentMonth] floatValue]]];
        last.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[lastYearVF1 objectAtIndex:currentMonth] floatValue]]];
        
        if ([[goalVF1 objectAtIndex:currentMonth] floatValue] == 0.0) {
            
            achieved.hidden = TRUE;
            
            goalImage.hidden = TRUE;
            
        } else {
            
            achieved.hidden = FALSE;
            goalImage.hidden = FALSE;
            
            achieved.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100];
            
            if (([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100 > 94.999) {
                
                [goalImage setImage:[UIImage imageNamed:@"yesImage.png"]];
                
            } else {
                
                [goalImage setImage:[UIImage imageNamed:@"noImage.png"]];
                
            }
            
        }
        
        if ([[lastYearVF1 objectAtIndex:currentMonth] floatValue] == 0) {
            
            yearOverYear.hidden = TRUE;
            
            yearOverYear.hidden = TRUE;
            
        } else {
            
            yearOverYear.hidden = FALSE;
            yearOverYear.hidden = FALSE;
            
            yearOverYear.text = [NSString stringWithFormat:@"%.2f%%",(([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[lastYearVF1 objectAtIndex:currentMonth] floatValue])*100.0)-100.0];
            
            if (([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[lastYearVF1 objectAtIndex:currentMonth] floatValue])*100 > 99.9999) {
                
                [lastImage setImage:[UIImage imageNamed:@"upArrow.png"]];
                
            } else {
                
                [lastImage setImage:[UIImage imageNamed:@"downArrow.png"]];
                
            }
            
        }
        
        
    } else if (currentVF == 2) {
        
        [vfChange setTitle:vfName2 forState:UIControlStateNormal];
        [staffInfo setTitle:[NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName] forState:UIControlStateNormal];
        
        monthName = [theMonths objectAtIndex:currentMonth];
        
        [monthChange setTitle:[NSString stringWithString:monthName] forState:UIControlStateNormal];
        
        goal.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[goalVF2 objectAtIndex:currentMonth] floatValue]]];
        actual.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[actualVF2 objectAtIndex:currentMonth] floatValue]]];
        last.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[lastYearVF2 objectAtIndex:currentMonth] floatValue]]];
        
        if ([[goalVF2 objectAtIndex:currentMonth] floatValue] == 0.0) {
            
            achieved.hidden = TRUE;
            
            goalImage.hidden = TRUE;
            
        } else {
            
            achieved.hidden = FALSE;
            goalImage.hidden = FALSE;
            
            achieved.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100];
            
            if (([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100 > 94.999) {
                
                [goalImage setImage:[UIImage imageNamed:@"yesImage.png"]];
                
            } else {
                
                [goalImage setImage:[UIImage imageNamed:@"noImage.png"]];
                
            }
            
        }
        
        if ([[lastYearVF2 objectAtIndex:currentMonth] floatValue] == 0) {
            
            yearOverYear.hidden = TRUE;
            
            yearOverYear.hidden = TRUE;
            
        } else {
            
            yearOverYear.hidden = FALSE;
            yearOverYear.hidden = FALSE;
            
            yearOverYear.text = [NSString stringWithFormat:@"%.2f%%",(([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[lastYearVF2 objectAtIndex:currentMonth] floatValue])*100.0)-100.0];
            
            if (([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[lastYearVF2 objectAtIndex:currentMonth] floatValue])*100 > 99.9999) {
                
                [lastImage setImage:[UIImage imageNamed:@"upArrow.png"]];
                
            } else {
                
                [lastImage setImage:[UIImage imageNamed:@"downArrow.png"]];
                
            }
            
        }
        
    } else if (currentVF == 3) {
        
        [vfChange setTitle:vfName3 forState:UIControlStateNormal];
        [staffInfo setTitle:[NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName] forState:UIControlStateNormal];
        
        monthName = [theMonths objectAtIndex:currentMonth];
        
        [monthChange setTitle:[NSString stringWithString:monthName] forState:UIControlStateNormal];
        
        goal.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[goalVF3 objectAtIndex:currentMonth] floatValue]]];
        actual.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[actualVF3 objectAtIndex:currentMonth] floatValue]]];
        last.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[lastYearVF3 objectAtIndex:currentMonth] floatValue]]];
        
        if ([[goalVF3 objectAtIndex:currentMonth] floatValue] == 0.0) {
            
            achieved.hidden = TRUE;
            
            goalImage.hidden = TRUE;
            
        } else {
            
            achieved.hidden = FALSE;
            goalImage.hidden = FALSE;
            
            achieved.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100];
            
            if (([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100 > 94.999) {
                
                [goalImage setImage:[UIImage imageNamed:@"yesImage.png"]];
                
            } else {
                
                [goalImage setImage:[UIImage imageNamed:@"noImage.png"]];
                
            }
            
        }
        
        if ([[lastYearVF3 objectAtIndex:currentMonth] floatValue] == 0) {
            
            yearOverYear.hidden = TRUE;
            
            yearOverYear.hidden = TRUE;
            
        } else {
            
            yearOverYear.hidden = FALSE;
            yearOverYear.hidden = FALSE;
            
            yearOverYear.text = [NSString stringWithFormat:@"%.2f%%",(([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[lastYearVF3 objectAtIndex:currentMonth] floatValue])*100.0)-100.0];
            
            if (([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[lastYearVF3 objectAtIndex:currentMonth] floatValue])*100 > 99.9999) {
                
                [lastImage setImage:[UIImage imageNamed:@"upArrow.png"]];
                
            } else {
                
                [lastImage setImage:[UIImage imageNamed:@"downArrow.png"]];
                
            }
            
        }
        
    } else if (currentVF == 4) {
        
        [vfChange setTitle:vfName4 forState:UIControlStateNormal];
        [staffInfo setTitle:[NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName] forState:UIControlStateNormal];
        
        monthName = [theMonths objectAtIndex:currentMonth];
        
        [monthChange setTitle:[NSString stringWithString:monthName] forState:UIControlStateNormal];
        
        goal.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[goalVF4 objectAtIndex:currentMonth] floatValue]]];
        actual.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[actualVF4 objectAtIndex:currentMonth] floatValue]]];
        last.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[lastYearVF4 objectAtIndex:currentMonth] floatValue]]];
        
        if ([[goalVF4 objectAtIndex:currentMonth] floatValue] == 0.0) {
            
            achieved.hidden = TRUE;
            
            goalImage.hidden = TRUE;
            
        } else {
            
            achieved.hidden = FALSE;
            goalImage.hidden = FALSE;
            
            achieved.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100];
            
            if (([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100 > 94.999) {
                
                [goalImage setImage:[UIImage imageNamed:@"yesImage.png"]];
                
            } else {
                
                [goalImage setImage:[UIImage imageNamed:@"noImage.png"]];
                
            }
            
        }
        
        if ([[lastYearVF4 objectAtIndex:currentMonth] floatValue] == 0) {
            
            yearOverYear.hidden = TRUE;
            
            yearOverYear.hidden = TRUE;
            
        } else {
            
            yearOverYear.hidden = FALSE;
            yearOverYear.hidden = FALSE;
            
            yearOverYear.text = [NSString stringWithFormat:@"%.2f%%",(([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[lastYearVF4 objectAtIndex:currentMonth] floatValue])*100.0)-100.0];
            
            if (([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[lastYearVF4 objectAtIndex:currentMonth] floatValue])*100 > 99.9999) {
                
                [lastImage setImage:[UIImage imageNamed:@"upArrow.png"]];
                
            } else {
                
                [lastImage setImage:[UIImage imageNamed:@"downArrow.png"]];
                
            }
            
        }
        
    } else if (currentVF == 5) {
        
        [vfChange setTitle:vfName5 forState:UIControlStateNormal];
        [staffInfo setTitle:[NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName] forState:UIControlStateNormal];
        
        monthName = [theMonths objectAtIndex:currentMonth];
        
        [monthChange setTitle:[NSString stringWithString:monthName] forState:UIControlStateNormal];
        
        goal.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[goalVF5 objectAtIndex:currentMonth] floatValue]]];
        actual.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[actualVF5 objectAtIndex:currentMonth] floatValue]]];
        last.text = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:[[lastYearVF5 objectAtIndex:currentMonth] floatValue]]];
        
        if ([[goalVF5 objectAtIndex:currentMonth] floatValue] == 0.0) {
            
            achieved.hidden = TRUE;
            
            goalImage.hidden = TRUE;
            
        } else {
            
            achieved.hidden = FALSE;
            goalImage.hidden = FALSE;
            
            achieved.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100];
            
            if (([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100 > 94.999) {
                
                [goalImage setImage:[UIImage imageNamed:@"yesImage.png"]];
                
            } else {
                
                [goalImage setImage:[UIImage imageNamed:@"noImage.png"]];
                
            }
            
        }
        
        if ([[lastYearVF5 objectAtIndex:currentMonth] floatValue] == 0) {
            
            yearOverYear.hidden = TRUE;
            
            yearOverYear.hidden = TRUE;
            
        } else {
            
            yearOverYear.hidden = FALSE;
            yearOverYear.hidden = FALSE;
            
            yearOverYear.text = [NSString stringWithFormat:@"%.2f%%",(([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[lastYearVF5 objectAtIndex:currentMonth] floatValue])*100.0)-100.0];
            
            if (([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[lastYearVF5 objectAtIndex:currentMonth] floatValue])*100 > 99.9999) {
                
                [lastImage setImage:[UIImage imageNamed:@"upArrow.png"]];
                
            } else {
                
                [lastImage setImage:[UIImage imageNamed:@"downArrow.png"]];
                
            }
            
        }
        
    }
    
    if (currentMonth > 0) {
        
        [prevMonth setTitle:[theMonths objectAtIndex:currentMonth-1] forState:UIControlStateNormal];
        
    } else {
        
        prevMonth.hidden = TRUE;
        
    }
    
    if (currentMonth < 11) {
        
        [nextMonth setTitle:[theMonths objectAtIndex:currentMonth+1] forState:UIControlStateNormal];
        
    } else {
        
        nextMonth.hidden = TRUE;
        
    }
    
}

- (IBAction)changeMonth:(UIButton *)sender {
    
    if (sender.tag == 10) {
        
        if (currentMonth == 1) {
            
            currentMonth = 0;
            sender.hidden = TRUE;
            
        } else if (currentMonth == 11) {
            
            currentMonth = 10;
            nextMonth.hidden = FALSE;
            
        } else {
            
            currentMonth = currentMonth - 1;
            
        }
        
        [self resetData];
        
    } else if (sender.tag == 20) {
        
        if (currentMonth == 0) {
            
            currentMonth = 1;
            prevMonth.hidden = FALSE;
            
        } else if (currentMonth == 10) {
            
            currentMonth = 11;
            sender.hidden = TRUE;
            
        } else {
            
            currentMonth = currentMonth + 1;
            
        }
        
        [self resetData];
        
    } else if (sender.tag == 30) {
        
        whichRight = 0;
        
        whichPicker = 1;
        
        [yearButton setTitle:@"Done"];
        
        thePickerArray = [NSMutableArray arrayWithArray:theMonths];
        
        [thePicker reloadAllComponents];
        
        [thePicker selectRow:currentMonth inComponent:0 animated:FALSE];
        
        thePicker.hidden = FALSE;
        
    }
    
}

- (IBAction)changeVF:(UIButton *)sender {
    
    whichRight = 0;
    
    whichPicker = 2;
    
    [yearButton setTitle:@"Done"];
    
    [thePickerArray removeAllObjects];
    
    [thePickerArray addObject:vfName1];
    [thePickerArray addObject:vfName2];
    [thePickerArray addObject:vfName3];
    
    if (isFour) {
        
        [thePickerArray addObject:vfName4];
        
    }
    
    if (isFive) {
        
        [thePickerArray addObject:vfName5];
        
    }
    
    [thePicker reloadAllComponents];
    
    thePicker.hidden = FALSE;
    
    
}

- (IBAction)changeYear:(UIBarButtonItem *)sender {
    
    if (whichRight == 0) {
        
        whichRight = 1;
        
        [yearButton setTitle:@""];
        
        thePicker.hidden = TRUE;
        
    } else if (whichRight == 1) {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Change Year" message:@"Only 2013 is currently available." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    }
    
}

- (IBAction)changeTerritory:(UIButton *)sender {
    
    whichRight = 0;
    
    whichPicker = 3;
    
    [yearButton setTitle:@"Done"];
    
    thePickerArray = [NSMutableArray arrayWithArray:theTerritories];
    
    [thePicker reloadAllComponents];
    
    thePicker.hidden = FALSE;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [thePickerArray count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [thePickerArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (whichPicker == 1) {
        
        [monthChange setTitle:[thePickerArray objectAtIndex:row] forState:UIControlStateNormal];
        
        currentMonth = row;
        
        [self resetData];
        
    } else if (whichPicker == 2) {
        
        [vfChange setTitle:[thePickerArray objectAtIndex:row] forState:UIControlStateNormal];
        
        currentVF = row + 1;
        
        [self resetData];
        
    } else if (whichPicker == 3) {
        
        staffNumber = [[theTerritoryNumbers objectAtIndex:row] integerValue];
        
        [self getDataFromStaff:staffNumber andYear:currentYear];
        
        [self resetData];
        
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex > 0) {
        
        currentVF = (int)buttonIndex;
        
        [self resetData];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
