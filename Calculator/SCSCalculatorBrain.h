//
//  SCSCalculatorBrain.h
//  Calculator
//
//  Created by Richard E Millet on 1/20/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCSCalculatorBrain : NSObject

- (void) enterNumber:(double)numberToEnter;
//
// Calculator operations
//
- (double) add;
- (double) substract;

@end
