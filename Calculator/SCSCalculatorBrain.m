//
//  SCSCalculatorBrain.m
//  Calculator
//
//  Created by Richard E Millet on 1/20/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import "SCSCalculatorBrain.h"

#define ADD_OPERATION @"add"
#define SUBTRACT_OPERATION @"substract"

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

- (double) add {
    return [self performBinaryOperation: ADD_OPERATION];
}

- (double) substract {
    return [self performBinaryOperation: SUBTRACT_OPERATION];
}


- (double)performBinaryOperation:(NSString *)operation {
    double result = 0;
    double rightOperand = [self popOperand];
    double leftOperand = [self popOperand];
    
    if ([operation isEqualToString: ADD_OPERATION]) {
        result = leftOperand + rightOperand;
    } else if (([operation isEqualToString: SUBTRACT_OPERATION])) {
        result = leftOperand - rightOperand;
    }
    
    [self pushOperand:result];
    return result;
}

@end
