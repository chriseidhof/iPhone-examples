//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Chris Eidhof on 11-01-11.
//  Copyright 2011 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CalculatorStateFirstNumber,
    CalculatorStateSecondNumber
} CalculatorState;

@interface CalculatorViewController : UIViewController {
}

@property (retain) IBOutlet UILabel* numberLabel;
@property NSUInteger number1;
@property NSUInteger number2;
@property CalculatorState state;
@property (retain) NSString* operator;

- (IBAction)digitButtonPressed:(UIButton*)sender;
- (IBAction)operatorButtonPressed:(UIButton*)sender;
- (IBAction)calculateButtonPressed:(UIButton*)sender;

@end

