//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Chris Eidhof on 11-01-11.
//  Copyright 2011 . All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

@synthesize numberLabel, number1, number2, state, operator;

- (void)updateLabel:(NSUInteger)number {
    self.numberLabel.text = number == 0 ? @"" : [NSString stringWithFormat:@"%d", number];
}

- (IBAction)digitButtonPressed:(UIButton*)sender {
    // Read the current digit
    NSUInteger currentVariableName = [[[sender titleLabel] text] intValue];

    // Update the number and label
    if(self.state == CalculatorStateFirstNumber) {
        self.number1 = 10*self.number1 + currentVariableName;        
        [self updateLabel:number1];
    } else {
        self.number2 = 10*self.number2 + currentVariableName;        
        [self updateLabel:number2];
    }
}

- (IBAction)operatorButtonPressed:(UIButton*)sender {
    if(self.state == CalculatorStateFirstNumber) {
        // Switch state
        self.state = CalculatorStateSecondNumber;
        self.operator = [[sender titleLabel] text];
        [self updateLabel:number2];
    } else {
        // error, not supported.
    }

}

- (IBAction)calculateButtonPressed:(UIButton*)sender {
    NSUInteger result = 0;
    if([self.operator isEqual:@"+"]) {
        result = self.number1 + self.number2;
    } else if([self.operator isEqual:@"-"]) {
        result = self.number1 - self.number2;
    } else if([self.operator isEqual:@"*"]) {
        result = self.number1 * self.number2;
    } else if([self.operator isEqual:@"/"] && self.number2 != 0) {
        result = self.number1 / self.number2;
    }
               
    [self updateLabel:result];
    
    // Reset the calculator
    self.state = CalculatorStateFirstNumber;
    self.number1 = 0;
    self.number2 = 0;
}

- (void)viewDidUnload {
    self.numberLabel = nil;
    self.operator = nil;
}


- (void)dealloc {
    self.numberLabel = nil;
    self.operator = nil;
    [super dealloc];
}

@end
