//
//  NotesAppDelegate.h
//  Notes
//
//  Created by Chris Eidhof on 31-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotesViewController;

@interface NotesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NotesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NotesViewController *viewController;

@end

