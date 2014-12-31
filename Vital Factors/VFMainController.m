//
//  VFMainController.m
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFMainController.h"

@interface VFMainController ()

@end

@implementation VFMainController

@synthesize doneButton;
@synthesize passwordButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    
        // Custom initialization
    
    }
    
    return self;

}

- (void)viewDidLoad {
    
    CGRect theRect;
    
    float thePlacement;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        thePlacement = 297.0;
        
    } else {
        
        thePlacement = 152.0;
        
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    pickerArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    theMonths = [[NSMutableArray alloc] initWithCapacity:5];
    
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
    
    vf1NameLabel.text = vfName1;
    vf2NameLabel.text = vfName2;
    vf3NameLabel.text = vfName3;
    vf4NameLabel.text = vfName4;
    vf5NameLabel.text = vfName5;
    
    if (theRegionNumbers == nil) {
        
        theRegions = [[NSMutableArray alloc] initWithCapacity:5];
        theRegionNumbers = [[NSMutableArray alloc] initWithCapacity:5];
        
        [theRegions addObject:regionName];
        [theRegionNumbers addObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"code"]];
        
    }
    
    thePicker.hidden = TRUE;
    
    currentMonth = [monthName intValue] - 1;
    currentRegion = [theRegionNumbers count] - 1;
    
    [monthButton setTitle:[theMonths objectAtIndex:currentMonth] forState:UIControlStateNormal];
    [regionButton setTitle:[theRegions objectAtIndex:currentRegion] forState:UIControlStateNormal];
    
    if ([[goalVF1 objectAtIndex:currentMonth] floatValue] == 0) {
        
        vf1Percent.hidden = TRUE;
        vf1Bar.hidden = TRUE;
        
        vf1Image.hidden = TRUE;
        vf1Button.hidden = TRUE;
        
    } else {
        
        [vf1Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
        
        theRect = vf1Bar.frame;
        
        theRect.size.height = thePlacement * (([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue]));
        theRect.size.width = 50.0;
        theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
        
        vf1Bar.frame = theRect;
        
        vf1Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100];
        
        if ( ([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
            
            [vf1Image setImage:[UIImage imageNamed:@"yesImage.png"]];
            [vf1Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
        } else {
            
            [vf1Image setImage:[UIImage imageNamed:@"noImage.png"]];
            [vf1Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    if ([[goalVF2 objectAtIndex:currentMonth] floatValue] == 0) {
        
        vf2Percent.hidden = TRUE;
        vf2Bar.hidden = TRUE;
        
        vf2Image.hidden = TRUE;
        vf2Button.hidden = TRUE;
        
    } else {
        
        [vf2Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
        
        theRect = vf2Bar.frame;
        
        theRect.size.height = thePlacement * (([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue]));
        theRect.size.width = 50.0;
        theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
        
        vf2Bar.frame = theRect;
        
        vf2Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100];
        
        if ( ([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
            
            [vf2Image setImage:[UIImage imageNamed:@"yesImage.png"]];
            [vf2Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
        } else {
            
            [vf2Image setImage:[UIImage imageNamed:@"noImage.png"]];
            [vf2Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    if ([[goalVF3 objectAtIndex:currentMonth] floatValue] == 0) {
        
        vf3Percent.hidden = TRUE;
        vf3Bar.hidden = TRUE;
        
        vf3Image.hidden = TRUE;
        vf3Button.hidden = TRUE;
        
    } else {
        
        [vf3Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
        
        theRect = vf3Bar.frame;
        
        theRect.size.height = thePlacement * (([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue]));
        theRect.size.width = 50.0;
        theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
        
        vf3Bar.frame = theRect;
        
        vf3Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100];
        
        if ( ([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
            
            [vf3Image setImage:[UIImage imageNamed:@"yesImage.png"]];
            [vf3Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
        } else {
            
            [vf3Image setImage:[UIImage imageNamed:@"noImage.png"]];
            [vf3Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }
        
    }
    
    if ( (isFour) && ([[goalVF4 objectAtIndex:currentMonth] floatValue] != 0) ) {
        
        [vf4Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
        
        theRect = vf4Bar.frame;
        
        theRect.size.height = thePlacement * (([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue]));
        theRect.size.width = 50.0;
        theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
        
        vf4Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100];
        
        vf4Bar.frame = theRect;
        
        if ( ([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
            
            [vf4Image setImage:[UIImage imageNamed:@"yesImage.png"]];
            [vf4Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
        } else {
            
            [vf4Image setImage:[UIImage imageNamed:@"noImage.png"]];
            [vf4Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }
        
        vf4NameLabel.hidden = FALSE;
        
    } else {
        
        vf4NameLabel.hidden = TRUE;
        
        vf4Percent.hidden = TRUE;
        vf4Bar.hidden = TRUE;
        
        vf4Image.hidden = TRUE;
        vf4Button.hidden = TRUE;
        
    }
    
    if ( (isFive) && ([[goalVF5 objectAtIndex:currentMonth] floatValue] != 0) ) {
        
        [vf5Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
        
        theRect = vf5Bar.frame;
        
        theRect.size.height = thePlacement * (([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue]));
        theRect.size.width = 50.0;
        theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
        
        vf5Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100];
        
        vf5Bar.frame = theRect;
        
        if ( ([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
            
            [vf5Image setImage:[UIImage imageNamed:@"yesImage.png"]];
            [vf5Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
            
        } else {
            
            [vf5Image setImage:[UIImage imageNamed:@"noImage.png"]];
            [vf5Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }
        
        vf5NameLabel.hidden = FALSE;
        
    } else {
        
        vf5NameLabel.hidden = TRUE;
        
        vf5Percent.hidden = TRUE;
        vf5Bar.hidden = TRUE;
        
        vf5Image.hidden = TRUE;
        vf5Button.hidden = TRUE;
        
        
    }
    
//    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = TRUE;
    
    whichRight = 1;
    
    [doneButton setTitle:@"Logout"];
    
    whichView = 0;
    
    graphView.hidden = TRUE;

}

- (BOOL)checkInternet {
    
    NSString *testString;
    
    testString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.myvitalfactors.com"] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    if (testString == nil) {
        
        return FALSE;
        
    } else {
        
        return TRUE;
        
    }
    
}

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear {
    
    if ([self checkInternet]) {
        
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
        
        vfName1 = @"";
        vfName2 = @"";
        vfName3 = @"";
        vfName4 = @"";
        vfName5 = @"";
        
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
                
                vf4NameLabel.hidden = TRUE;
                vf4Bar.hidden = TRUE;
                vf4Percent.hidden = TRUE;
                vf4Button.hidden = TRUE;
                vf4Image.hidden = TRUE;
                
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
                
                vf5NameLabel.hidden = TRUE;
                vf5Bar.hidden = TRUE;
                vf5Percent.hidden = TRUE;
                vf5Button.hidden = TRUE;
                vf5Image.hidden = TRUE;
                
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
        
    } else {
        
        [self.navigationController popToRootViewControllerAnimated:TRUE];
        
    }
    
    
    
}

- (IBAction)showGraph:(UIButton *)sender {
    
    if (whichView == 0) {
        
        [graphButton setTitle:@"Table View" forState:UIControlStateNormal];
        
        graphView.hidden = FALSE;
        
        whichView = 1;
        
    } else {
        
        [graphButton setTitle:@"Graph View" forState:UIControlStateNormal];
        
        graphView.hidden = TRUE;
        
        whichView = 0;
        
    }
    
}

- (IBAction)changeMonth:(UIButton *)sender {
    
    whichRight = 0;
    
    [doneButton setTitle:@"Done"];
    
    whichPicker = 1;
    
    pickerArray = [NSMutableArray arrayWithArray:theMonths];
    
    [thePicker reloadAllComponents];
    
    thePicker.hidden = FALSE;
    
    [thePicker selectRow:currentMonth inComponent:0 animated:FALSE];
    
    graphButton.hidden = TRUE;
    
}

- (IBAction)changeRegion:(UIButton *)sender {
    
    whichRight = 0;
    
    [doneButton setTitle:@"Done"];
    
    whichPicker = 2;
    
    pickerArray = [NSMutableArray arrayWithArray:theRegions];
    
    [thePicker reloadAllComponents];
    
    thePicker.hidden = FALSE;
    
    [thePicker selectRow:currentRegion inComponent:0 animated:FALSE];
    
    graphButton.hidden = TRUE;
    
}

- (IBAction)finishedChoosing:(UIBarButtonItem *)sender {
    
    if (whichRight == 0) {
        
        [doneButton setTitle:@"Logout"];
        
        thePicker.hidden = TRUE;
        
        graphButton.hidden = FALSE;
        
        whichRight = 1;
        
    } else if (whichRight == 1) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"loggedin"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"firstname"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastname"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"title"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"region"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"code"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"accesscode"];
        
        [self.navigationController popToRootViewControllerAnimated:TRUE];
        
    }
    
}

- (IBAction)seeDetail:(UIButton *)sender {
    
    detailNumber = sender.tag;
    
    [self performSegueWithIdentifier:@"mainToDetail" sender:sender];
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [pickerArray count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [pickerArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    CGRect theRect;
    
    float thePlacement;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        thePlacement = 297.0;
        
    } else {
        
        thePlacement = 152.0;
        
    }
    
    if (whichPicker == 1) {
        
        [monthButton setTitle:[pickerArray objectAtIndex:row] forState:UIControlStateNormal];
        
        currentMonth = row;
        
        if ([[goalVF1 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf1Percent.hidden = TRUE;
            vf1Bar.hidden = TRUE;
            
            vf1Image.hidden = TRUE;
            vf1Button.hidden = TRUE;
            
        } else {
            
            vf1Percent.hidden = FALSE;
            vf1Bar.hidden = FALSE;
            
            vf1Image.hidden = FALSE;
            vf1Button.hidden = FALSE;
            
            [vf1Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf1Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf1Bar.frame = theRect;
            
            vf1Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf1Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf1Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf1Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf1Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ([[goalVF2 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf2Percent.hidden = TRUE;
            vf2Bar.hidden = TRUE;
            
            vf2Image.hidden = TRUE;
            vf2Button.hidden = TRUE;
            
        } else {
            
            vf2Percent.hidden = FALSE;
            vf2Bar.hidden = FALSE;
            
            vf2Image.hidden = FALSE;
            vf2Button.hidden = FALSE;
            
            [vf2Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf2Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf2Bar.frame = theRect;
            
            vf2Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf2Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf2Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf2Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf2Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ([[goalVF3 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf3Percent.hidden = TRUE;
            vf3Bar.hidden = TRUE;
            
            vf3Image.hidden = TRUE;
            vf3Button.hidden = TRUE;
            
        } else {
            
            vf3Percent.hidden = FALSE;
            vf3Bar.hidden = FALSE;
            
            vf3Image.hidden = FALSE;
            vf3Button.hidden = FALSE;
            
            [vf3Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf3Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf3Bar.frame = theRect;
            
            vf3Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf3Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf3Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf3Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf3Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ( (isFour) && ([[goalVF4 objectAtIndex:currentMonth] floatValue] != 0) ) {

            vf4Percent.hidden = FALSE;
            vf4Bar.hidden = FALSE;
            
            vf4Image.hidden = FALSE;
            vf4Button.hidden = FALSE;
            vf5NameLabel.hidden = FALSE;
            
            [vf4Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf4Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf4Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100];
            
            vf4Bar.frame = theRect;
            
            if ( ([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf4Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf4Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf4Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf4Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        } else {
            
            vf4Percent.hidden = TRUE;
            vf4Bar.hidden = TRUE;
            
            vf4Image.hidden = TRUE;
            vf4Button.hidden = TRUE;
            vf4NameLabel.hidden = TRUE;
            
        }
        
        if ( (isFive) && ([[goalVF5 objectAtIndex:currentMonth] floatValue] != 0) ) {
            
            vf5Percent.hidden = FALSE;
            vf5Bar.hidden = FALSE;
        
            vf5Image.hidden = FALSE;
            vf5Button.hidden = FALSE;
            vf4NameLabel.hidden = FALSE;
            
            [vf5Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf5Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf5Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100];
            
            vf5Bar.frame = theRect;
            
            if ( ([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf5Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf5Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf5Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf5Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        } else {
            
            vf5Percent.hidden = TRUE;
            vf5Bar.hidden = TRUE;
            
            vf5Image.hidden = TRUE;
            vf5Button.hidden = TRUE;
            vf5NameLabel.hidden = TRUE;
            
            
        }
        
    } else if (whichPicker == 2) {
        
        [regionButton setTitle:[pickerArray objectAtIndex:row] forState:UIControlStateNormal];
        
        currentRegionNumber = [[theRegionNumbers objectAtIndex:row] intValue];
        
        currentRegion = row;
        
        [self getDataFromStaff:currentRegionNumber andYear:currentYear];
        
        if ([[goalVF1 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf1Percent.hidden = TRUE;
            vf1Bar.hidden = TRUE;
            
            vf1Image.hidden = TRUE;
            vf1Button.hidden = TRUE;
            
        } else {
            
            vf1Percent.hidden = FALSE;
            vf1Bar.hidden = FALSE;
            
            vf1Image.hidden = FALSE;
            vf1Button.hidden = FALSE;
            
            [vf1Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf1Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf1Bar.frame = theRect;
            
            vf1Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF1 objectAtIndex:currentMonth] floatValue]/[[goalVF1 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf1Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf1Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf1Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf1Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ([[goalVF2 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf2Percent.hidden = TRUE;
            vf2Bar.hidden = TRUE;
            
            vf2Image.hidden = TRUE;
            vf2Button.hidden = TRUE;
            
        } else {
            
            vf2Percent.hidden = FALSE;
            vf2Bar.hidden = FALSE;
            
            vf2Image.hidden = FALSE;
            vf2Button.hidden = FALSE;
            
            [vf2Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf2Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf2Bar.frame = theRect;
            
            vf2Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF2 objectAtIndex:currentMonth] floatValue]/[[goalVF2 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf2Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf2Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf2Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf2Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ([[goalVF3 objectAtIndex:currentMonth] floatValue] == 0) {
            
            vf3Percent.hidden = TRUE;
            vf3Bar.hidden = TRUE;
            
            vf3Image.hidden = TRUE;
            vf3Button.hidden = TRUE;
            
        } else {
            
            vf3Percent.hidden = FALSE;
            vf3Bar.hidden = FALSE;
            
            vf3Image.hidden = FALSE;
            vf3Button.hidden = FALSE;
            
            [vf3Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf3Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf3Bar.frame = theRect;
            
            vf3Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100];
            
            if ( ([[actualVF3 objectAtIndex:currentMonth] floatValue]/[[goalVF3 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf3Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf3Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf3Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf3Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        }
        
        if ( (isFour) && ([[goalVF4 objectAtIndex:currentMonth] floatValue] != 0) ) {
            
            vf4Percent.hidden = FALSE;
            vf4Bar.hidden = FALSE;
            
            vf4Image.hidden = FALSE;
            vf4Button.hidden = FALSE;
            
            vf4NameLabel.hidden = FALSE;
            
            [vf4Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf4Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf4Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100];
            
            vf4Bar.frame = theRect;
            
            if ( ([[actualVF4 objectAtIndex:currentMonth] floatValue]/[[goalVF4 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf4Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf4Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf4Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf4Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        } else {
            
            vf4Percent.hidden = TRUE;
            vf4Bar.hidden = TRUE;
            
            vf4Image.hidden = TRUE;
            vf4Button.hidden = TRUE;
            vf4NameLabel.hidden = TRUE;
            
        }
        
        if ( (isFive) && ([[goalVF5 objectAtIndex:currentMonth] floatValue] != 0) ) {
            
            vf5Percent.hidden = FALSE;
            vf5Bar.hidden = FALSE;
            
            vf5Image.hidden = FALSE;
            vf5Button.hidden = FALSE;
            
            vf5NameLabel.hidden = FALSE;
            
            [vf5Button setTitle:[NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100] forState:UIControlStateNormal];
            
            theRect = vf5Bar.frame;
            
            theRect.size.height = thePlacement * (([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue]));
            theRect.size.width = 50.0;
            theRect.origin.y = 49.0 + (thePlacement + 49.0 - theRect.size.height);
            
            vf5Percent.text = [NSString stringWithFormat:@"%.2f%%",([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100];
            
            vf5Bar.frame = theRect;
            
            if ( ([[actualVF5 objectAtIndex:currentMonth] floatValue]/[[goalVF5 objectAtIndex:currentMonth] floatValue])*100 > 94.99999) {
                
                [vf5Image setImage:[UIImage imageNamed:@"yesImage.png"]];
                [vf5Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                
            } else {
                
                [vf5Image setImage:[UIImage imageNamed:@"noImage.png"]];
                [vf5Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
            
        } else {
            
            vf5Percent.hidden = TRUE;
            vf5Bar.hidden = TRUE;
            
            vf5Image.hidden = TRUE;
            vf5Button.hidden = TRUE;
            vf5NameLabel.hidden = TRUE;
            
            
        }
        
        vf1NameLabel.text = vfName1;
        vf2NameLabel.text = vfName2;
        vf3NameLabel.text = vfName3;
        vf4NameLabel.text = vfName4;
        vf5NameLabel.text = vfName5;
        
    }
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"mainToDetail"]) {
        
        NSInteger newDetailNumber;
        
        VFMonthlyReportController *theController;
        
        newDetailNumber = detailNumber/100;
        
        theController = [segue destinationViewController];
        
        [theController createStartupForStaff:[[theRegionNumbers objectAtIndex:currentRegion] integerValue] month:currentMonth vf:newDetailNumber territories:theRegions numbers:theRegionNumbers];
        
    }
    
}

- (IBAction)passwordButton:(UIBarButtonItem *)sender {
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Change Password" message:@"Enter Password and Confirm:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    [[theAlert textFieldAtIndex:0] setSecureTextEntry:TRUE];
    
    [theAlert textFieldAtIndex:0].placeholder = @"Password";
    [theAlert textFieldAtIndex:1].placeholder = @"Confirm Password";
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:[alertView textFieldAtIndex:1].text]) {
            
            UIAlertView *theAlert;
            
            NSString *setString, *finalString;
            
            setString = [NSString stringWithFormat:@"http://www.myvitalfactors.com/changePassword2.php?who=%d&password=%@",[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue],[alertView textFieldAtIndex:0].text];
            
            finalString = [NSString stringWithContentsOfURL:[NSURL URLWithString:setString] encoding:NSStringEncodingConversionAllowLossy error:nil];
            
            if ([finalString isEqualToString:@"FALSE"]) {
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error saving your password, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
            } else {
                
                theAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your new password has been saved." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithString:[alertView textFieldAtIndex:0].text] forKey:@"password"];
                
            }
            
            [theAlert show];
            
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
