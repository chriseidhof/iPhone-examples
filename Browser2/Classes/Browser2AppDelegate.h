//
//  Browser2AppDelegate.h
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface Browser2AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UIViewController *navigationController;
    RootViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewController *navigationController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@end

