//
//  ViewController.m
//  MyFavoriteThings
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextField *myTextField;
    __weak IBOutlet UITextView *myTextView;
    NSMutableArray * array;
}
- (IBAction)addText:(id)sender;
- (IBAction)removeText:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	array = [NSMutableArray arrayWithCapacity:10];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addText:(id)sender {
    if (![myTextField.text isEqual: @""]) {
        myTextView.text = @"";
        [array addObject:myTextField.text];
        for (NSString * labelString in array){
            myTextView.text = [NSString stringWithFormat:@"%@ %@\n", myTextView.text, labelString];
        }
        myTextField.text = @"";
    }
}

- (IBAction)removeText:(id)sender {
        myTextView.text = @"";
        [array removeObject:myTextField.text]; //change myTextField.text to something that would remove that array value
        for (NSString * labelString in array){
            myTextView.text = [NSString stringWithFormat:@"%@ %@\n", myTextView.text, labelString];
        }
        myTextField.text = @"";
}
@end

