//
//  FavoritesModel.h
//  Browser2
//
//  Created by Chris Eidhof on 13-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FavoritesModel : NSObject {
}

- (NSUInteger)count;
- (NSString*)favoriteAtIndex:(NSUInteger)index;
- (void)addFavorite:(NSString*)favoriteText;

@end
