//
//  ViewController.m
//  Categories
//
//  Created by Maria Merino on 7/31/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "NSString+MMExtensions.h"

@interface ViewController (){
    
    __weak IBOutlet UILabel *theLabel;
    __weak IBOutlet UITextField *theTextField;
}
- (IBAction)updateLabelText:(id)sender;


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

- (IBAction)updateLabelText:(id)sender {
    theLabel.text = [theTextField.text mmReverseString];
}
@end
