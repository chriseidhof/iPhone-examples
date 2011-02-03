//
//  FavoritesModel.m
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import "FavoritesModel.h"

@interface FavoritesModel ()

@property (nonatomic, retain) NSMutableArray* items;

@end


@implementation FavoritesModel

@synthesize items;

- (id)init {
    if(self = [super init]) {
        self.items = [NSMutableArray arrayWithCapacity:5];
    }
    return self;
}

- (NSUInteger)count {
    return [self.items count];
}

- (NSString*)favoriteAtIndex:(NSUInteger)index {
    return [self.items objectAtIndex:index];
}

- (void)addFavorite:(NSString*)favoriteText {
    [self.items addObject:favoriteText];
}

- (void)dealloc {
    self.items = nil;
    [super dealloc];
}

@end
