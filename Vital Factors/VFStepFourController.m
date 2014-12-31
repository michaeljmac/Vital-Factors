//
//  VFStepFourController.m
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepFourController.h"

@interface VFStepFourController ()

@end

@implementation VFStepFourController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *startDate = [allData objectAtIndex:13];
    
    NSDate *first, *second, *third, *fourth, *fifth;
    
    NSInteger totalAmount, totalNumber, i;
    
    NSArray *countryArray, *totalNewArray, *totalExistingArray, *bonusNewArray, *bonusExistingArray;
    
    NSInteger total1, total2, total3, total4, total5, amount1, amount2, amount3, amount4, amount5;
    
    totalAmount = 0;
    totalNumber = 0;
    
    countryArray = [NSArray arrayWithArray:[allData objectAtIndex:21]];
    totalNewArray = [NSArray arrayWithArray:[allData objectAtIndex:18]];
    totalExistingArray = [NSArray arrayWithArray:[allData objectAtIndex:17]];
    bonusNewArray = [NSArray arrayWithArray:[allData objectAtIndex:20]];
    bonusExistingArray = [NSArray arrayWithArray:[allData objectAtIndex:19]];
    
    for (i=0; i<[countryArray count]; i++) {
        
        totalNumber = totalNumber + [[totalExistingArray objectAtIndex:i] intValue] + [[totalNewArray objectAtIndex:i] intValue];
        totalAmount = totalAmount + ([[bonusExistingArray objectAtIndex:i] intValue] * [[totalExistingArray objectAtIndex:i] intValue]) + ([[bonusNewArray objectAtIndex:i] intValue] * [[totalNewArray objectAtIndex:i] intValue]);
        
    }
    
    agreementAmount = totalAmount;
    
    if ([[allData objectAtIndex:9] isEqualToString:@"Exclusive"]) {
        
        first = [startDate dateByAddingTimeInterval:60*60*24*90];
        second = [startDate dateByAddingTimeInterval:60*60*24*365];
        third = [startDate dateByAddingTimeInterval:60*60*24*365*2];
        fourth = [startDate dateByAddingTimeInterval:60*60*24*365*3];
        fifth = [startDate dateByAddingTimeInterval:60*60*24*365*4];
        
        total1 = totalNumber * .2;
        total2 = totalNumber * .21;
        total3 = totalNumber * .15;
        total4 = totalNumber * .15;
        total5 = totalNumber * .15;
        
        amount1 = totalAmount * .2;
        amount2 = totalAmount * .21;
        amount3 = totalAmount * .15;
        amount4 = totalAmount * .15;
        amount5 = totalAmount * .15;
        
        numberArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
        percentArray = [NSMutableArray arrayWithObjects:@"20%", @"21%", @"15%", @"15%", @"15%", nil];
        dateArray = [NSMutableArray arrayWithObjects:first.description,second.description,third.description,fourth.description,fifth.description, nil];
        amountArray = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%ld",amount1], [NSString stringWithFormat:@"%ld",amount2], [NSString stringWithFormat:@"%ld",amount3], [NSString stringWithFormat:@"%ld",amount4], [NSString stringWithFormat:@"%ld",amount5], nil];
        wiresArray = [NSMutableArray arrayWithObjects:@"70%", @"100%", @"100%", @"100%", @"100%", nil];
        totalArray = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%ld",total1], [NSString stringWithFormat:@"%ld",total2], [NSString stringWithFormat:@"%ld",total3], [NSString stringWithFormat:@"%ld",total4], [NSString stringWithFormat:@"%ld",total5], nil];
        
    } else {
        
        first = [startDate dateByAddingTimeInterval:60*60*24*90];
        second = [startDate dateByAddingTimeInterval:60*60*24*150];
        third = [startDate dateByAddingTimeInterval:60*60*24*365];
        fourth = [startDate dateByAddingTimeInterval:60*60*24*365*2];
        fifth = [startDate dateByAddingTimeInterval:60*60*24*365*3];
        
        total1 = totalNumber * .19;
        total2 = totalNumber * .18;
        total3 = totalNumber * .21;
        total4 = totalNumber * .21;
        total5 = totalNumber * .21;
        
        amount1 = totalAmount * .19;
        amount2 = totalAmount * .18;
        amount3 = totalAmount * .21;
        amount4 = totalAmount * .21;
        amount5 = totalAmount * .21;
        
        numberArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
        percentArray = [NSMutableArray arrayWithObjects:@"19%", @"18%", @"21%", @"21%", @"21%", nil];
        dateArray = [NSMutableArray arrayWithObjects:first.description,second.description,third.description,fourth.description,fifth.description, nil];
        amountArray = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%ld",amount1], [NSString stringWithFormat:@"%ld",amount2], [NSString stringWithFormat:@"%ld",amount3], [NSString stringWithFormat:@"%ld",amount4], [NSString stringWithFormat:@"%ld",amount5], nil];
        wiresArray = [NSMutableArray arrayWithObjects:@"50%", @"100%", @"100%", @"100%", @"100%", nil];
        totalArray = [NSMutableArray arrayWithObjects:[NSString stringWithFormat:@"%ld",total1], [NSString stringWithFormat:@"%ld",total2], [NSString stringWithFormat:@"%ld",total3], [NSString stringWithFormat:@"%ld",total4], [NSString stringWithFormat:@"%ld",total5], nil];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compileData:(NSArray *)theData {
    
    allData = [NSArray arrayWithArray:theData];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"Payment Terms";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        VFFourHeaderTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
        
        return theCell;
        
    } else if ((indexPath.row > 0) && (indexPath.row < 6)) {
        
        VFFourDataTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
        
        theCell.numberLabel.text = [numberArray objectAtIndex:indexPath.row-1];
        theCell.percentLabel.text = [percentArray objectAtIndex:indexPath.row-1];
        theCell.amountLabel.text = [NSString stringWithFormat:@"$%@",[amountArray objectAtIndex:indexPath.row-1]];
        theCell.dateLabel.text = [dateArray objectAtIndex:indexPath.row-1];
        theCell.wiresNewLabel.text = [wiresArray objectAtIndex:indexPath.row-1];
        theCell.wiresTotalLabel.text = [totalArray objectAtIndex:indexPath.row-1];
        
        return theCell;
        
    } else if (indexPath.row == 6) {
        
        VFFourTotalTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"totalCell" forIndexPath:indexPath];
        
        theCell.totalText.text = [NSString stringWithFormat:@"$%ld",(long)agreementAmount];
        
        return theCell;
        
    } else {
        
        VFFourHeaderTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
        
        return theCell;
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:FALSE];
    
}

- (IBAction)continueButton:(UIBarButtonItem *)sender {
    
    [self performSegueWithIdentifier:@"stepFourToStepFive" sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    NSMutableArray *theArray;
    
    theArray = [NSMutableArray arrayWithArray:allData];
    
    VFStepFiveController *theController;
    
    theController = [segue destinationViewController];
    
    [theController compileData:allData];

}


@end
