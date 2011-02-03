//
//  CoreMotionAppDelegate.m
//  CoreMotion
//
//  Created by Chris Eidhof on 01-02-11.
//  Copyright 2011 . All rights reserved.
//

#import "CoreMotionAppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation CoreMotionAppDelegate

@synthesize window, blockView, manager;


#pragma mark -
#pragma mark Application lifecycle

- (void)startTracking {
//    [self.blockView removeFromSuperview];
    self.blockView.layer.borderColor = [UIColor blackColor].CGColor;
    self.blockView.layer.borderWidth = 3;
    self.manager = [[CMMotionManager alloc] init];
    NSTimeInterval interval = 1.0f/60.0f;
    CGFloat originalSize = self.blockView.frame.size.width;
    [self.manager setDeviceMotionUpdateInterval:interval];
    [self.manager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                 withHandler:^(CMDeviceMotion *motion, NSError *error)
     {
         CMAttitude* att = motion.attitude;
         self.window.backgroundColor = [UIColor colorWithRed:fabsf(att.pitch) green:fabsf(att.roll) blue:fabsf(att.yaw) alpha:1];
         CGRect newFrame = self.blockView.frame;
         newFrame.origin.x = fminf(fmaxf(0, newFrame.origin.x + 2*att.roll), 320-newFrame.size.width);
         newFrame.origin.y = fminf(fmaxf(20, newFrame.origin.y + 2*att.pitch), 480-newFrame.size.height);
         newFrame.size.width  = originalSize * (1 + att.yaw);
         newFrame.size.height = originalSize * (1 + att.yaw);
         self.blockView.frame = newFrame;
         
         // If you want to use acceleration instead of attitude:
         //
         // CMAcceleration acc = motion.userAcceleration;
         // self.window.backgroundColor = [UIColor colorWithRed:fabsf(acc.x) green:fabsf(acc.y) blue:fabsf(acc.z) alpha:1];
     }];
    
}

// Don't forget to stop updates in dealloc (or in viewWillDisappear: if you're in a UIViewController)
- (void)stopTracking {
    [self.manager stopDeviceMotionUpdates];
    self.manager = nil;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    [self startTracking];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [self stopTracking];
    self.blockView = nil;
    self.window = nil;
    [super dealloc];
}


@end
