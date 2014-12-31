//
//  VFTabBarController.m
//  vital factors
//
//  Created by Michael Reiland on 12/29/14.
//  Copyright (c) 2014 Michael Reiland. All rights reserved.
//

#import "VFTabBarController.h"

@interface VFTabBarController ()

@end

@implementation VFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated  {
    
    //self.navigationController.navigationBarHidden = TRUE;
    
    self.navigationItem.hidesBackButton = TRUE;
    
    VFMainController *theController;
    
    theController = [[self viewControllers] objectAtIndex:1];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] > 1000) {
        
        [theController getDataFromStaff:0 andYear:2013];
        
    } else {
        
        [theController getDataFromStaff:[[[NSUserDefaults standardUserDefaults] objectForKey:@"code"] intValue] andYear:2014];
        
    }
    
    UIBarButtonItem *theLeftButton, *theRightButton;
    
    theLeftButton = self.navigationItem.leftBarButtonItem;
    theRightButton = self.navigationItem.rightBarButtonItem;

    theController.passwordButton = theLeftButton;
    theController.doneButton = theRightButton;
    
    [theRightButton setTitle:@"Logout"];
    
    [theRightButton setTarget:theController];
    
    [theLeftButton setTarget:theController];
    
    [theRightButton setAction:@selector(finishedChoosing:)];
    
    [theLeftButton setAction:@selector(passwordButton:)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finishedChoosing:(UIBarButtonItem *)sender {
    
    [[[self viewControllers] objectAtIndex:1] finishedChoosing:sender];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
