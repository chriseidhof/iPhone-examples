//
//  WebViewController.m
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize url, webView, urlField, favorites;

- (void)loadUrlString:(NSString*)urlString {
    NSURL* theURL = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:theURL];
    [self.webView loadRequest:request];
}

- (IBAction)addFavorite:(id)sender {
    [self.favorites addFavorite:self.urlField.text];
}

- (IBAction)loadUrl:(id)sender {
    [self loadUrlString:self.urlField.text];
    [self.urlField resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    self.urlField.text = self.url;
    [self loadUrlString:self.url];
    [super viewWillAppear:animated];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    self.urlField = nil;
    self.url = nil;
    [super dealloc];
}


@end
