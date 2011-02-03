//
//  ChordView.m
//  ChordFinder
//
//  Created by Chris Eidhof on 17-01-11.
//  Copyright 2011 . All rights reserved.
//

#import "ChordView.h"


@implementation ChordView

@synthesize chord, editable;

- (void)drawLine:(CGContextRef)ctx width:(CGFloat)width from:(CGPoint)from to:(CGPoint)to color:(UIColor*)color {
    UIGraphicsPushContext(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
    CGContextSetLineWidth(ctx, width);
    CGContextMoveToPoint(ctx, from.x, from.y);
    CGContextAddLineToPoint(ctx, to.x, to.y);        
    CGContextStrokePath(ctx);
    
    UIGraphicsPopContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect called");
    // Drawing code.
    [[UIColor brownColor] set];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextFillRect(ctx, rect);
    
    // Draw horizontal lines
    CGFloat horizontalInterval = rect.size.width / 5;
    for(int i = 0; i < 5; i++) {
        [self drawLine:ctx 
                 width:3.0
                  from:CGPointMake(horizontalInterval*i, 0) 
                    to:CGPointMake(horizontalInterval*i, rect.size.height)
                 color:[UIColor whiteColor]
         ];
    }
    
    // Draw vertical lines
    CGFloat verticalInterval = rect.size.height / 6;
    for(int i = 0; i < 6; i++) {
        [self drawLine:ctx
                 width:1.0
                  from:CGPointMake(0, verticalInterval*i)
                    to:CGPointMake(rect.size.height, verticalInterval * i) 
                 color:[UIColor whiteColor]];
    }
    
    // Draw chord
    
    CGFloat size = 20;
    
    [[UIColor blackColor] set];
    for(int i = 0; i < 6; i++) {
        NSUInteger pos = [[self.chord objectAtIndex:i] intValue];
        if(pos > 0) {
            CGFloat x = horizontalInterval * pos - (horizontalInterval/2) - size/2;
            CGFloat y = rect.size.height - (verticalInterval*i) - size/2.0;
            CGRect newRect = CGRectMake(x, y, 20, 20);
            CGContextFillEllipseInRect(ctx, newRect);
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!self.editable) return;
    
    CGSize boundsSize = self.bounds.size;
    CGFloat horizontalInterval = boundsSize.width  / 5;
    CGFloat verticalInterval   = boundsSize.height / 6;
    CGPoint location = [[touches anyObject] locationInView:self];
    NSUInteger string = 6 - ((location.y - verticalInterval/2) / verticalInterval);
    NSUInteger fret   = 1+ (location.x / horizontalInterval);
    NSNumber* fretNumber = [NSNumber numberWithInt:fret];
    
    NSMutableArray* newChord = [NSMutableArray arrayWithArray:self.chord];
    if([[self.chord objectAtIndex:string] isEqualToNumber:fretNumber]) {
        fretNumber = [NSNumber numberWithInt:0];
    }
    [newChord replaceObjectAtIndex:string withObject:fretNumber];
    NSLog(@"oldChord: %@, newChord: %@", self.chord, newChord);
    self.chord = newChord;
    
    [self setNeedsDisplay];
}

- (void)dealloc {
    self.chord = nil;
    [super dealloc];
}


@end
