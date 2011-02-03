//
//  WebViewController.h
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesModel.h"

@interface WebViewController : UIViewController {
}

@property (retain) NSString* url;
@property (retain) IBOutlet UIWebView* webView;
@property (retain) IBOutlet UITextField* urlField;

@property (retain) FavoritesModel* favorites;

- (IBAction)loadUrl:(id)sender;
- (IBAction)addFavorite:(id)sender;

@end
