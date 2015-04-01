//
//  ViewController.m
//  Palindrome
//
//  Created by Maria Merino on 7/12/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITextField *inputTextField;
    __weak IBOutlet UILabel *resultLabel;
    
    int result;
}
- (IBAction)check:(id)sender;

@end

@implementation ViewController

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

-(void)showIsPalindrone
{
    resultLabel.text = @"Is a palindrone!";
}

-(void)showIsNotPalindrone
{
    resultLabel.text = @"Not a palindrone!";
}


-(const char*)getCharacterArray
{
    return [inputTextField.text UTF8String];
}


-(void)showResult
{
    resultLabel.text = [NSString stringWithFormat:@"%i", result];
}


-(void)checkForPalindrome
{
    const char* arrayOfCharacters = [self getCharacterArray];
    BOOL isPalindrome = NO;
    
    int length = 0;
    
    while (arrayOfCharacters[length] != 0) {
        length++;
        NSLog(@"length = %i", length);
    }
    NSLog(@"half length = %i", (length/2));
    // Insert code in here to check the characters of the array for palindronishness
    int z = length - 1;
    int y = 0;
    
    for (y = 0; y<(length/2); y++) {
        if (arrayOfCharacters[z] == arrayOfCharacters[y]) {
            NSLog(@"y = %i", y);
            NSLog(@"z = %i", z);
            z--;
        }
    }
    
    if (z <= y) {
        isPalindrome = YES;
    } else {
        isPalindrome = NO;
    }
    
    if (isPalindrome == NO){
        [self showIsNotPalindrone];
    }else{
        [self showIsPalindrone];
    }

}


-(void)sumIntegers
{
    const char* arrayOfCharacters = [self getCharacterArray];
    
    // parse out the commas, sum up the integers and assign the answer to the variable result
    // i.e.
    // result =

    
    [self showResult];
}

- (IBAction)check:(id)sender
{
    [self checkForPalindrome];
    
    // Uncomment the following line of code and comment out the previous line of code to run summation
    //[self sumIntegers];
}
@end
