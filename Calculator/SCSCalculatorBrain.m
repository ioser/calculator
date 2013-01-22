//
//  SCSCalculatorBrain.m
//  Calculator
//
//  Created by Richard E Millet on 1/20/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import "SCSCalculatorBrain.h"

@interface SCSCalculatorBrain()
    @property (strong, nonatomic) NSMutableArray *operandStack;
@end

@implementation SCSCalculatorBrain

- (NSMutableArray *) operandStack {
    if (_operandStack == nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:@(operand)]; // @(expression) creates an NSObject
}

- (double)popOperand {
    NSNumber *poppedNumber = [self.operandStack lastObject];
    if (poppedNumber != nil) {
        [self.operandStack removeLastObject];
    }
    return [poppedNumber doubleValue];
}

- (void)enterNumber:(double)numberToEnter {
    [self pushOperand:numberToEnter];
}

@end
