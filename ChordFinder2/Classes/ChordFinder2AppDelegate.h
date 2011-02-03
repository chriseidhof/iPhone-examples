//
//  ChordFinder2AppDelegate.h
//  ChordFinder2
//
//  Created by Chris Eidhof on 17-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChordFinder2AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

