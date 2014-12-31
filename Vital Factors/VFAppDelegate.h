//
//  VFAppDelegate.h
//  Vital Factors
//
//  Created by Michael Reiland on 12/24/13.
//  Copyright (c) 2013 Michael Reiland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFAppDelegate : UIResponder <UIApplicationDelegate> {
    
    NSDate *backgroundDate;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *isInternet;

@end
