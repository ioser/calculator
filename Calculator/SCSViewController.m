//
//  SCSViewController.m
//  Calculator
//
//  Created by Richard E Millet on 1/18/13.
//  Copyright (c) 2013 Richard E Millet. All rights reserved.
//

#import "SCSViewController.h"
#import "SCSCalculatorBrain.h"

@interface SCSViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (strong, nonatomic) SCSCalculatorBrain *brain;

@end

@implementation SCSViewController {
    BOOL userIsInTheMiddleOfEnteringANumber;
}

- (SCSCalculatorBrain *) brain {
    if (_brain == nil) {
        _brain = [[SCSCalculatorBrain alloc] init];
    }
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appendDigit:(NSString *)digitPressed {
    self.calculatorDisplay.text =
        [self.calculatorDisplay.text stringByAppendingString:digitPressed];
}

- (void)displayDigit:(NSString *)digitPressed {
    self.calculatorDisplay.text = digitPressed;
    userIsInTheMiddleOfEnteringANumber = YES;
}

- (IBAction)digitButtonPressed:(UIButton *)sender {
    NSString *digitPressed = sender.currentTitle;
    
    if (userIsInTheMiddleOfEnteringANumber) {
        [self appendDigit:digitPressed];
    } else {
        [self displayDigit:digitPressed];
    }
    NSLog(@"The '%@' digit was pressed.", digitPressed);
}

- (IBAction)clearDisplay:(UIButton *)sender {
    self.calculatorDisplay.text = @"0";
    userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)enterButtonPressed:(UIButton *)sender {
    
    double enteredNumber = [self.calculatorDisplay.text doubleValue];
    [self.brain enterNumber:enteredNumber];
    userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)zeroPressed:(UIButton *)sender {
    NSString *digitPressed = sender.currentTitle;

    if (userIsInTheMiddleOfEnteringANumber) {
        [self appendDigit:digitPressed];
    }
}

@end
