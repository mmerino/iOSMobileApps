//
//  ViewController.m
//  TocaLosViews
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *subview in self.view.subviews){
        if ([subview isKindOfClass:[MyView class]]) {
            MyView * myView = (MyView*)subview;
            myView.delegate = self;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didChooseView: (MyView *)myview{
    NSLog(@"%i", myview.tag);
}

@end
