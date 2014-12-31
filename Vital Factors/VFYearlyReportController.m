//
//  VFYearlyReportController.m
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import "VFYearlyReportController.h"

@interface VFYearlyReportController ()

@end

@implementation VFYearlyReportController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    
        // Custom initialization
    
    }
    
    return self;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    theReport.delegate = self;
    theReport.dataSource = self;
    
    theMonths = [[NSMutableArray alloc] initWithCapacity:12];
    
    [theMonths addObject:@"Jan"];
    [theMonths addObject:@"Feb"];
    [theMonths addObject:@"Mar"];
    [theMonths addObject:@"Apr"];
    [theMonths addObject:@"May"];
    [theMonths addObject:@"Jun"];
    [theMonths addObject:@"Jul"];
    [theMonths addObject:@"Aug"];
    [theMonths addObject:@"Sep"];
    [theMonths addObject:@"Oct"];
    [theMonths addObject:@"Nov"];
    [theMonths addObject:@"Dec"];
    [theMonths addObject:@"Total"];
    
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
    
    collectionArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    currentVF = 1;
    
    currentYear = 2013;
    
    [self getDataFromStaff:[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] andYear:currentYear];
    
    currentMonth = [monthName intValue];
    
    [self resetData];
    
}

- (void)getDataFromStaff:(NSInteger)theNumber andYear:(NSInteger)theYear {
    
    NSString *dataReponse, *textUrl;
    
    textUrl = [NSString stringWithFormat:@"http://www.myvitalfactors.com/getData.php?who=%ld&when=%ld",(long)theNumber,(long)theYear];
    
    dataReponse = [NSString stringWithContentsOfURL:[NSURL URLWithString:textUrl] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
//    dataReponse = @"Michael;Reiland;President;Southwest;2;1,2,2;2,3,2;3,4,3;4,5,4;5,6,5;6,7,6;7,8,7;8,9,8;9,10,9;10,11,12;11,12,11;12,13,12;72,84,72;1,3,2;2,4,2;3,5,3;4,6,4;5,7,5;6,8,6;7,9,7;8,10,8;9,11,9;10,12,12;11,13,11;12,14,12;72,96,72;1,4,2;2,5,2;3,6,3;4,7,4;5,8,5;6,9,6;7,10,7;8,11,8;9,12,9;10,13,12;11,14,11;12,15,12;72,108,72;1,5,2;2,6,2;3,7,3;4,8,4;5,9,5;6,10,6;7,11,7;8,12,8;9,13,9;10,14,12;11,14,11;12,16,12;72,120,72";
    
    if ([dataReponse isEqualToString:@"ERROR"]) {
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was a data error, please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    } else {
        
        int i;
        
        NSArray *theArray;
        
        theArray = [dataReponse componentsSeparatedByString:@";"];
        
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
        
        for (i=18; i<31; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF2 addObject:[theArray2 objectAtIndex:0]];
            [actualVF2 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF2 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        for (i=31; i<44; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF3 addObject:[theArray2 objectAtIndex:0]];
            [actualVF3 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF3 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        for (i=44; i<57; i++) {
            
            NSArray *theArray2;
            
            theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@","];
            
            [goalVF4 addObject:[theArray2 objectAtIndex:0]];
            [actualVF4 addObject:[theArray2 objectAtIndex:1]];
            [lastYearVF4 addObject:[theArray2 objectAtIndex:2]];
            
        }
        
        
    }
    
}

- (void)resetData {
    
    [collectionArray removeAllObjects];
    
    [collectionArray addObject:theMonths];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        vfNumber.text = @"VF1, VF2, VF3, VF4";
        vfTitle.text = @"VF1, VF2, VF3, VF4";
        staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
        
        [collectionArray addObject:goalVF1];
        [collectionArray addObject:actualVF1];
        [collectionArray addObject:actualVF1];
        [collectionArray addObject:lastYearVF1];
        [collectionArray addObject:lastYearVF1];
        [collectionArray addObject:goalVF2];
        [collectionArray addObject:actualVF2];
        [collectionArray addObject:actualVF2];
        [collectionArray addObject:lastYearVF2];
        [collectionArray addObject:lastYearVF2];
        [collectionArray addObject:goalVF3];
        [collectionArray addObject:actualVF3];
        [collectionArray addObject:actualVF3];
        [collectionArray addObject:lastYearVF3];
        [collectionArray addObject:lastYearVF3];
        [collectionArray addObject:goalVF4];
        [collectionArray addObject:actualVF4];
        [collectionArray addObject:actualVF4];
        [collectionArray addObject:lastYearVF4];
        [collectionArray addObject:lastYearVF4];
        
    } else {
        
        switch (currentVF) {
            
            case 1:
                
                vfNumber.text = @"VF1";
                vfTitle.text = @"VF1";
                staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
                
                [collectionArray addObject:goalVF1];
                [collectionArray addObject:actualVF1];
                [collectionArray addObject:actualVF1];
                [collectionArray addObject:lastYearVF1];
                [collectionArray addObject:lastYearVF1];
                break;
            
            case 2:
                
                vfNumber.text = @"VF2";
                vfTitle.text = @"VF2";
                staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
                
                [collectionArray addObject:goalVF2];
                [collectionArray addObject:actualVF2];
                [collectionArray addObject:actualVF2];
                [collectionArray addObject:lastYearVF2];
                [collectionArray addObject:lastYearVF2];
                break;
                
            case 3:
                
                vfNumber.text = @"VF3";
                vfTitle.text = @"VF3";
                staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
                
                [collectionArray addObject:goalVF3];
                [collectionArray addObject:actualVF3];
                [collectionArray addObject:actualVF3];
                [collectionArray addObject:lastYearVF3];
                [collectionArray addObject:lastYearVF3];
                break;
                
            case 4:
                
                vfNumber.text = @"VF4";
                vfTitle.text = @"VF4";
                staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
                
                [collectionArray addObject:goalVF4];
                [collectionArray addObject:actualVF4];
                [collectionArray addObject:actualVF4];
                [collectionArray addObject:lastYearVF4];
                [collectionArray addObject:lastYearVF4];
                break;
                
            default:
                
                
                vfNumber.text = @"VF1";
                vfTitle.text = @"VF1";
                staffInfo.text = [NSString stringWithFormat:@"%@ %@, %@ - %@",firstName,lastName,positionTitle,regionName];
                
                [collectionArray addObject:goalVF1];
                [collectionArray addObject:actualVF1];
                [collectionArray addObject:actualVF1];
                [collectionArray addObject:lastYearVF1];
                [collectionArray addObject:lastYearVF1];
                break;
        
        }
        
    }
    
    [theReport reloadData];
    
}

- (IBAction)changeVF:(UIButton *)sender {
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Change VF" message:@"Select VF to view:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"VF1",@"VF2",@"VF3",@"VF4", nil];
    
    [theAlert show];
    
    
}

- (IBAction)changeYear:(UIBarButtonItem *)sender {
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Change Year" message:@"Only 2013 is currently available." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [theAlert show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex > 0) {
        
        currentVF = buttonIndex;
        
        [self resetData];
        
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [collectionArray count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 13;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *theCell;
    
    UILabel *theLabel;
    
    theCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reportCell" forIndexPath:indexPath];
    
    theLabel = (UILabel *)[theCell viewWithTag:100];
    
    theLabel.text = [[collectionArray objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    
    return theCell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
