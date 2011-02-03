//
//  RootViewController.h
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesModel.h"

@interface RootViewController : UITableViewController {
}

@property (retain) FavoritesModel* favorites;

@end
