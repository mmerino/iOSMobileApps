//
//  ViewController.m
//  IBFun
//
//  Created by Maria Merino on 7/10/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UILabel *myFirstLabel;
    
    __weak IBOutlet UITextField *myFirstTextField;
    SecondViewController * mySecondViewController;
    
}
- (IBAction)myFirstButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	myFirstLabel.text = @"somthing new";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myFirstButton:(id)sender {
    myFirstLabel.text = myFirstTextField.text;
    
    mySecondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:mySecondViewController.view];
}
@end
