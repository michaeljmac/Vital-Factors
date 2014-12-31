//
//  VFStaffTableController.h
//  Vital Factors
//
//  Created by Michael Reiland on 1/2/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFAccountController.h"

@interface VFStaffTableController : UITableViewController {
    
    NSMutableArray *idArray, *firstArray, *lastArray, *emailArray, *territoryArray, *passwordArray, *titleArray;
    
}

- (void)setUpArrays;

@end
