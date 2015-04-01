//
//  ViewController.m
//  ViewFunHouse
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIButton *colorValue;
    
    __weak IBOutlet UIButton *resizeButton;
    
    __weak IBOutlet UIButton *toggleButton;

    __weak IBOutlet UILabel *firstNumberLabel;

    __weak IBOutlet UILabel *secondNumberLabel;
    
    __weak IBOutlet UILabel *sumNumberLabel;
    
    __weak IBOutlet UILabel *sliderLabel;
    
    __weak IBOutlet UISlider *slider;
    
    __weak IBOutlet UIImageView *colorImage;
    
    __weak IBOutlet UIButton *colorizeBtn;
}

- (IBAction)changeColor:(id)sender;

- (IBAction)toggleAction:(id)sender;

- (IBAction)sliderAction:(id)sender;

- (IBAction)mathAction:(id)sender;

- (IBAction)colorizeAction:(id)sender;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)changeColor:(id)sender {
    colorValue.BackgroundColor = [UIColor blackColor];
    
    resizeButton.frame = CGRectMake(20, 100, 281, 100);
    
    //resizeButton.frame = [CGRectGetHeight(CGPointMake(200.0f, 200.0f))];
    
   // resizeButton.frame = [CGRectMake(40, 90, 300, 100)];
    
    // colorValue.titleLabel.textColor = [UIColor redColor];

}



- (IBAction)toggleAction:(id)sender {

    if ([toggleButton.titleLabel.text isEqual: @"Off"]) {
        [toggleButton setTitle:@"On" forState:UIControlStateNormal];
    }else{
        [toggleButton setTitle:@"Off" forState:UIControlStateNormal];
    }
//   toggleButton.titleLabel = [UIControlStateNormal]
}

- (IBAction)sliderAction:(id)sender {
    
    sliderLabel.text = [NSString stringWithFormat:@"%f", slider.value];
}

- (IBAction)mathAction:(id)sender {
    //sumNumberLabel.text = firstNumberLabel.text;
    
    //sumNumberLabel.text = [NSString stringWithFormat:@"%@", firstNumberLabel.text];
    
    //How do you get a number out of a label's text (string)?
    sumNumberLabel.text = [NSString stringWithFormat:@"%i",[firstNumberLabel.text intValue] + [secondNumberLabel.text intValue]];
    //sumNumberLabel.text = [NSString stringWithFormat:@"%i", 10];
}

- (IBAction)colorizeAction:(id)sender {
    colorImage.image = [UIImage imageNamed: @"MobileMakersLogo_color.png"];
}

@end