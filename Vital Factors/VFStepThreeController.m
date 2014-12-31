//
//  VFStepThreeController.m
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepThreeController.h"

@interface VFStepThreeController ()

@end

@implementation VFStepThreeController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    countryArray = [[NSMutableArray alloc] initWithCapacity:5];
    agentArray = [[NSMutableArray alloc] initWithCapacity:5];
    existingArray = [[NSMutableArray alloc] initWithCapacity:5];
    newArray = [[NSMutableArray alloc] initWithCapacity:5];
    existingTotalArray = [[NSMutableArray alloc] initWithCapacity:5];
    newTotalArray = [[NSMutableArray alloc] initWithCapacity:5];
    existingBonusArray = [[NSMutableArray alloc] initWithCapacity:5];
    newBonusArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    isComplete = FALSE;
    isAgent = FALSE;
    isExisting = FALSE;
    isNew = FALSE;
    isEBonus = FALSE;
    isNBonus = FALSE;

}

- (void)viewDidAppear:(BOOL)animated {
    
    if ([countryArray count] == 0) {
        
        whichAlert = 2;
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Enter the Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
        
        [theAlert show];
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if ((whichAlert == 1) || (whichAlert == 2)) {
        
        if ((buttonIndex == 1) || (whichAlert == 2)) {
            
            if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
                
                if (whichAlert == 2) {
                    
                    UIAlertView *theAlert;
                    
                    theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Enter the Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    
                    [theAlert show];
                    
                } else {
                    
                    UIAlertView *theAlert;
                    
                    theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Enter the Country" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
                    
                    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    
                    [theAlert show];
                    
                }
                
            } else {
                
                [countryArray addObject:[alertView textFieldAtIndex:0].text];
                
                [agentArray addObject:[NSArray arrayWithObjects:@"Agent ID", @"Agent ID", @"Agent ID", @"Agent ID", @"Agent ID", nil]];
                
                [existingArray addObject:[NSArray arrayWithObjects:@"Existing Wires", @"Existing Wires", @"Existing Wires", @"Existing Wires", @"Existing Wires", nil]];
                
                [newArray addObject:[NSArray arrayWithObjects:@"New Wires", @"New Wires", @"New Wires", @"New Wires", @"New Wires", nil]];
                
                [existingTotalArray addObject:@"0"];
                
                [newTotalArray addObject:@"0"];
                
                [existingBonusArray addObject:@"0"];
                
                [newBonusArray addObject:@"0"];
                
                [dataTable reloadData];
                
                whichAlert = 0;
                
            }
            
        }
        
    } else if (whichAlert == 3) {
        
        if (buttonIndex == 1) {
            
            NSMutableArray *theArray;
            
            theArray = [NSMutableArray arrayWithArray:[agentArray objectAtIndex:commonSection]];
            
            [theArray replaceObjectAtIndex:commonRow withObject:[alertView textFieldAtIndex:0].text];
            
            [agentArray replaceObjectAtIndex:commonSection withObject:[NSArray arrayWithArray:theArray]];
            
            isAgent = TRUE;
            
            [dataTable reloadData];
            
        }
        
    } else if (whichAlert == 4) {
        
        if (buttonIndex == 1) {
            
            NSMutableArray *theArray;
            
            NSInteger total, i;
            
            total = 0;
            
            theArray = [NSMutableArray arrayWithArray:[existingArray objectAtIndex:commonSection]];
            
            [theArray replaceObjectAtIndex:commonRow withObject:[alertView textFieldAtIndex:0].text];
            
            for (i=0; i<[theArray count]; i++) {
                
                total = total + [[theArray objectAtIndex:i] intValue];
                
            }
            
            [existingArray replaceObjectAtIndex:commonSection withObject:[NSArray arrayWithArray:theArray]];
            
            [existingTotalArray replaceObjectAtIndex:commonSection withObject:[NSString stringWithFormat:@"%ld",total]];
            
            isExisting = TRUE;
            
            [dataTable reloadData];
            
        }
        
    } else if (whichAlert == 5) {
        
        if (buttonIndex == 1) {
            
            NSMutableArray *theArray;
            
            NSInteger total, i;
            
            total = 0;
            
            theArray = [NSMutableArray arrayWithArray:[newArray objectAtIndex:commonSection]];
            
            [theArray replaceObjectAtIndex:commonRow withObject:[alertView textFieldAtIndex:0].text];
            
            for (i=0; i<[theArray count]; i++) {
                
                total = total + [[theArray objectAtIndex:i] intValue];
                
            }
            
            [newArray replaceObjectAtIndex:commonSection withObject:[NSArray arrayWithArray:theArray]];
            
            [newTotalArray replaceObjectAtIndex:commonSection withObject:[NSString stringWithFormat:@"%ld",total]];
            
            isNew = TRUE;
            
            [dataTable reloadData];
            
        }
        
    } else if (whichAlert == 6) {
        
        if (buttonIndex == 1) {
            
            [existingBonusArray replaceObjectAtIndex:commonSection withObject:[alertView textFieldAtIndex:0].text];
            
            isEBonus = TRUE;
            
            [dataTable reloadData];
            
        }
        
    } else if (whichAlert == 7) {
        
        if (buttonIndex == 1) {
            
            [newBonusArray replaceObjectAtIndex:commonSection withObject:[alertView textFieldAtIndex:0].text];
            
            isNBonus = TRUE;
            
            [dataTable reloadData];
            
        }
        
    }
    
}

- (IBAction)addCountry:(UIButton *)sender {
    
    whichAlert = 1;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"Enter the Country" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert show];
    
}

#pragma mark - Table Datasource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [countryArray objectAtIndex:section];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (isAgent && isExisting && isNew && isEBonus && isNBonus) {
        
        isComplete = TRUE;
        
    }
    
    return [countryArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < 5) {
        
        VFThreeTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
        
        [theCell.agentButton setTitle:[[agentArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        [theCell.wireExistingButton setTitle:[[existingArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        [theCell.wireNewButton setTitle:[[newArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
        theCell.agentButton.tag = (indexPath.section * 10) + indexPath.row;
        theCell.wireExistingButton.tag = (indexPath.section * 10) + indexPath.row;
        theCell.wireNewButton.tag = (indexPath.section * 10) + indexPath.row;
        
        return theCell;
        
    } else if (indexPath.row == 5) {
        
        VFThreeTotalTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"totalCell" forIndexPath:indexPath];
        
        theCell.wireExistingTotal.text = [existingTotalArray objectAtIndex:indexPath.section];
        theCell.wireNewTotal.text = [newTotalArray objectAtIndex:indexPath.section];
        
        theCell.wireExistingTotal.tag = (indexPath.section * 10) + indexPath.row;
        theCell.wireNewTotal.tag = (indexPath.section * 10) + indexPath.row;
        
        return theCell;
        
    } else if (indexPath.row == 6) {
        
        VFThreeBonusTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"bonusCell" forIndexPath:indexPath];
        
        [theCell.wireExistingBonus setTitle:[NSString stringWithFormat:@"$%@.00",[existingBonusArray objectAtIndex:indexPath.section]] forState:UIControlStateNormal];
        [theCell.wireNewBonus setTitle:[NSString stringWithFormat:@"$%@.00",[newBonusArray objectAtIndex:indexPath.section]] forState:UIControlStateNormal];
        
        theCell.wireExistingBonus.tag = (indexPath.section * 10) + indexPath.row;
        theCell.wireNewBonus.tag = (indexPath.section * 10) + indexPath.row;
        
        return theCell;
        
    } else {
        
        VFThreeTableViewCell *theCell;
        
        theCell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
        
        return theCell;
        
    }
    
}

#pragma mark - Table Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:FALSE];
    
}

#pragma mark - Data Updates

- (IBAction)changeAgentID:(UIButton *)sender {
    
    commonSection = (sender.tag - (sender.tag % 10)) / 10;
    commonRow = sender.tag % 10;
    
    whichAlert = 3;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Agent ID" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
    
    [theAlert show];
    
}

- (IBAction)changeExistingWires:(UIButton *)sender{
    
    commonSection = (sender.tag - (sender.tag % 10)) / 10;
    commonRow = sender.tag % 10;
    
    whichAlert = 4;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Existing Wires" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
    
    [theAlert show];
    
}

- (IBAction)changeNewWires:(UIButton *)sender {
    
    commonSection = (sender.tag - (sender.tag % 10)) / 10;
    commonRow = sender.tag % 10;
    
    whichAlert = 5;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"New Wires" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
    
    [theAlert show];
    
}

- (IBAction)changeExistingBonus:(UIButton *)sender {
    
    commonSection = (sender.tag - (sender.tag % 10)) / 10;
    commonRow = sender.tag % 10;
    
    whichAlert = 6;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"Existing Wires Bonus" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
    
    [theAlert show];
    
}

- (IBAction)changeNewBonus:(UIButton *)sender {
    
    commonSection = (sender.tag - (sender.tag % 10)) / 10;
    commonRow = sender.tag % 10;
    
    whichAlert = 7;
    
    UIAlertView *theAlert;
    
    theAlert = [[UIAlertView alloc] initWithTitle:@"Enter" message:@"New Wires Bonus" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    theAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [theAlert textFieldAtIndex:0].keyboardType = UIKeyboardTypeDecimalPad;
    
    [theAlert show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compileData:(NSArray *)theData {
    
    allData = [NSArray arrayWithArray:theData];
    
}

- (IBAction)continueButton:(UIBarButtonItem *)sender {
    
    if (isComplete) {
        
        [self performSegueWithIdentifier:@"stepThreeToStepFour" sender:self];
        
    } else {
        
        whichAlert = 0;
        
        UIAlertView *theAlert;
        
        theAlert = [[UIAlertView alloc] initWithTitle:@"" message:@"You must enter data for all fields to continue" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [theAlert show];
        
    }
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSMutableArray *theArray;
    
    VFStepFourController *theController;
    
    theController = [segue destinationViewController];
    
    theArray = [NSMutableArray arrayWithArray:allData];
    
    [theArray addObject:agentArray];
    [theArray addObject:existingArray];
    [theArray addObject:newArray];
    [theArray addObject:existingTotalArray];
    [theArray addObject:newTotalArray];
    [theArray addObject:existingBonusArray];
    [theArray addObject:newBonusArray];
    [theArray addObject:countryArray];
    
    [theController compileData:theArray];
    
}


@end
