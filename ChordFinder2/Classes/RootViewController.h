//
//  RootViewController.h
//  ChordFinder2
//
//  Created by Chris Eidhof on 17-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordViewController.h"

@interface RootViewController : UITableViewController <ChordViewControllerDelegate> {
}

@property (retain) NSMutableDictionary* chords;
@property (retain) NSMutableArray* chordKeys;

@end
