//
//  RootViewController.m
//  ChordFinder2
//
//  Created by Chris Eidhof on 17-01-11.
//  Copyright 2011 . All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize chords, chordKeys;


#pragma mark -
#pragma mark View lifecycle

- (NSString*)chordPListFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"chords.plist"];
}

- (void)initializePListFile {
    NSString* fileName = [self chordPListFileName];
    NSFileManager* fm = [NSFileManager defaultManager];
    if(![fm fileExistsAtPath:fileName]) {
        NSString* sourceFileName = [[NSBundle mainBundle] pathForResource:@"chords" ofType:@"plist"];    
        [fm copyItemAtPath:sourceFileName toPath:fileName error:NULL];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializePListFile];
    
    NSString* fileName = [self chordPListFileName];
    NSMutableDictionary* myChords = [NSMutableDictionary dictionaryWithContentsOfFile:fileName];
    self.chords = myChords;
    self.chordKeys = [NSMutableArray arrayWithArray:[myChords allKeys]];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addChord:)] 
                                                 autorelease];
}

- (void)addChord:(id)sender {
    ChordViewController* chordVC = [[[ChordViewController alloc] initWithNibName:@"ChordViewController" bundle:nil] autorelease];
    NSNumber* zero = [NSNumber numberWithInt:0];
    chordVC.chord = [NSArray arrayWithObjects:zero,zero,zero,zero,zero,zero,nil];
    chordVC.editable = YES;
    chordVC.delegate = self;
    [self.navigationController pushViewController:chordVC animated:YES];
    
}

- (void)chordAdded:(NSArray *)chord name:(NSString *)name {
    // Update the data model
    [self.chords setObject:chord forKey:name];
    [self.chordKeys addObject:name];
    
    // Store the data model to disk
    NSString* fileName = [self chordPListFileName];
    [self.chords writeToFile:fileName atomically:YES];
    
    [self.tableView reloadData];
    
    // Pop the viewcontroller
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chordKeys count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [self.chordKeys objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChordViewController* chordVC = [[[ChordViewController alloc] initWithNibName:@"ChordViewController" bundle:nil] autorelease];
    NSString* key = [self.chordKeys objectAtIndex:indexPath.row];
    chordVC.chord = [self.chords objectForKey:key];
    chordVC.title = key;
    [self.navigationController pushViewController:chordVC animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    self.chords = nil;
    self.chordKeys = nil;
    [super dealloc];
}


@end

