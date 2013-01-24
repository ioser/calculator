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

- (id)init {
    self = [super init];
    
    if (self != nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSMutableArray *) operandStack {
    if (_operandStack == nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:@(operand)]; // @(expression) creates an NSObject
    [self logOperandStack];
}

- (double)popOperand {
    NSNumber *poppedNumber = [self.operandStack lastObject];
    if (poppedNumber != nil) {
        [self.operandStack removeLastObject];
    }
    [self logOperandStack];
    return [poppedNumber doubleValue];
}

- (void)logOperandStack {
    NSLog(@"The operand stack = %@", self.operandStack);
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
    [self logOperandStack];
    return result;
}

- (void) dumpOperandStack {
	NSLog(@"--- Top of stack dump.");
	for (int i = 0; i < [self.operandStack count]; i++) {
		NSLog(@"%@", [self.operandStack objectAtIndex:i]);
	}
	NSLog(@"--- Bottom of stack dump.");
}


@end
