//
//  ChordViewController.h
//  ChordFinder2
//
//  Created by Chris Eidhof on 17-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChordView.h"

@protocol ChordViewControllerDelegate

- (void)chordAdded:(NSArray*)chord name:(NSString*)name;

@end


@interface ChordViewController : UIViewController <UITextFieldDelegate> {

}

@property (retain) IBOutlet UITextField* chordName;
@property (retain) IBOutlet ChordView* chordView;

@property (assign) BOOL editable;
@property (retain) NSArray* chord;

@property (assign) id<ChordViewControllerDelegate> delegate;

@end
