//
//  CoreMotionAppDelegate.h
//  CoreMotion
//
//  Created by Chris Eidhof on 01-02-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionAppDelegate : NSObject <UIApplicationDelegate> {
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIView *blockView;
@property (nonatomic, retain) CMMotionManager* manager;

@end

