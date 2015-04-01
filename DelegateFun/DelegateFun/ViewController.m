//
//  ViewController.m
//  DelegateFun
//
//  Created by Maria Merino on 7/15/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    SecondViewController *secondViewController;
    __weak IBOutlet UILabel *colorLabel;
    
}

@end

@implementation ViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    secondViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview: secondViewController.view ];
    secondViewController.view.center = self.view.center;
    secondViewController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Delegate
- (void) ChangeColor: (UIColor *)color{
    self.view.backgroundColor = color;
}
- (void) ChangeText: (NSString *)text;{
    colorLabel.text = text;
}
@end
