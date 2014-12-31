//
//  VFStaffTableController.m
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStaffTableController.h"

@interface VFStaffTableController ()

@end

@implementation VFStaffTableController

- (id)initWithStyle:(UITableViewStyle)style {

    self = [super initWithStyle:style];
    
    if (self) {
    
        // Custom initialization
    
    }
    
    return self;

}

- (void)viewDidLoad {
    
    [super viewDidLoad];

}

- (void)setUpArrays {
    
    int i;
    
    NSArray *theArray;
    
    NSString *theString;
    
    idArray = [[NSMutableArray alloc] initWithCapacity:5];
    firstArray = [[NSMutableArray alloc] initWithCapacity:5];
    lastArray = [[NSMutableArray alloc] initWithCapacity:5];
    emailArray = [[NSMutableArray alloc] initWithCapacity:5];
    territoryArray = [[NSMutableArray alloc] initWithCapacity:5];
    passwordArray = [[NSMutableArray alloc] initWithCapacity:5];
    titleArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    theString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.myvitalfactors.com/getStaff.php"] encoding:NSStringEncodingConversionAllowLossy error:nil];
    
    theArray = [theString componentsSeparatedByString:@"::"];
    
    for (i=0; i<[theArray count]; i++) {
        
        NSArray *theArray2;
        
        theArray2 = [[theArray objectAtIndex:i] componentsSeparatedByString:@";;"];
        
        [idArray addObject:[theArray2 objectAtIndex:0]];
        [firstArray addObject:[theArray2 objectAtIndex:1]];
        [lastArray addObject:[theArray2 objectAtIndex:2]];
        [emailArray addObject:[theArray2 objectAtIndex:3]];
        [territoryArray addObject:[theArray2 objectAtIndex:4]];
        [passwordArray addObject:[theArray2 objectAtIndex:5]];
        [titleArray addObject:[theArray2 objectAtIndex:6]];
        
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSInteger theRow;
    
    NSArray *staffArray;
    
    theRow = [self.tableView indexPathForCell:(UITableViewCell *)sender].row;
    
    VFAccountController *theController;
    
    theController = [segue destinationViewController];
    
    staffArray = [NSArray arrayWithObjects:[idArray objectAtIndex:theRow],[firstArray objectAtIndex:theRow],[lastArray objectAtIndex:theRow],[emailArray objectAtIndex:theRow],[territoryArray objectAtIndex:theRow],[passwordArray objectAtIndex:theRow],[titleArray objectAtIndex:theRow], nil];
    
    [theController setUpWith:staffArray];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [firstArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"staffCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@, - %@",[lastArray objectAtIndex:indexPath.row],[firstArray objectAtIndex:indexPath.row],[territoryArray objectAtIndex:indexPath.row]];
    
    return cell;
}



@end
