//
//  ViewController.m
//  MagicEightBall
//
//  Created by Maria Merino on 7/10/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "MagicEightBall.h"

@interface ViewController ()
{
    __weak IBOutlet UILabel *answerLabel;
}
- (IBAction)shake:(id)sender;
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

- (IBAction)shake:(id)sender
{
    answerLabel.text = @"needs work!"; // add your code here.  Call a method on your class that returns one of several random strings.
    
    NSString *passString;
    
    passString = @"";
    
    MagicEightBall * shakeItUp;
    shakeItUp = [[MagicEightBall alloc]init];
    
    answerLabel.text = [shakeItUp getRandomString:passString];

    
}
@end
