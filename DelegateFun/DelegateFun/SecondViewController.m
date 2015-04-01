//
//  SecondViewController.m
//  DelegateFun
//
//  Created by Maria Merino on 7/15/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import "SecondViewController.h"

@interface SecondViewController (){
    __weak IBOutlet UITextField *textField;
}
- (IBAction)makeRed:(id)sender;
- (IBAction)makeGreen:(id)sender;
- (IBAction)makeBlue:(id)sender;
- (IBAction)makeYellow:(id)sender;
- (IBAction)changeText:(id)sender;

@end

@implementation SecondViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeRed:(id)sender {
  [delegate ChangeColor:[UIColor redColor]];
}

- (IBAction)makeGreen:(id)sender {
    [delegate ChangeColor:[UIColor greenColor]];
}

- (IBAction)makeBlue:(id)sender {
    [delegate ChangeColor:[UIColor blueColor]];
}

- (IBAction)makeYellow:(id)sender {
    [delegate ChangeColor:[UIColor yellowColor]];
}

- (IBAction)changeText:(id)sender {
    if ([textField.text isEqual: @"red"]){
        [delegate ChangeColor:[UIColor redColor]];
        [delegate ChangeText:textField.text];
    } else if ([textField.text isEqual: @"green"]){
        [delegate ChangeColor:[UIColor greenColor]];
        [delegate ChangeText:textField.text];
    }else if ([textField.text isEqual: @"blue"]){
        [delegate ChangeColor:[UIColor blueColor]];
        [delegate ChangeText:textField.text];
    }else if ([textField.text isEqual: @"yellow"]){
        [delegate ChangeColor:[UIColor yellowColor]];
        [delegate ChangeText:textField.text];
    }else{
        
    }
    
}

/*
 -(UIColor *)getColor:(NSString*)col {
 SEL selColor = NSSelectorFromString(col);
 UIColor *color = nil;
 if ( [UIColor respondsToSelector:selColor] == YES) {
 color = [UIColor performSelector:selColor];
 }
 return color;
 }
*/

@end
