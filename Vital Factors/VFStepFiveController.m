//
//  VFStepFiveController.m
//  vital factors
//
//  Created by Michael Reiland on 12/30/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFStepFiveController.h"

@interface VFStepFiveController ()

@end

@implementation VFStepFiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isComplete = TRUE;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)compileData:(NSArray *)theData {
    
    allData = [NSArray arrayWithArray:theData];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    VFStepSixController *theController;
    
    theController = [segue destinationViewController];
    
    [theController compileData:allData];
    
}


@end
