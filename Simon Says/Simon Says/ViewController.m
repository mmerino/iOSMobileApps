//
//  ViewController.m
//  Simon Says
//
//  Created by Maria Merino on 7/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController ()
{
    NSArray *arrayOfTags;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    arrayOfTags = @[@"1",@"3", @"2", @"2",@"5",@"6"];
    
    [self animateAllViewsFromTagArray:arrayOfTags atIndex:0];
}

-(void)animateAllViewsFromTagArray:(NSArray *)tagArray atIndex:(NSUInteger)tagIndex {
        
    UIView *selectedView = nil;
    
    NSString *tagString = [tagArray objectAtIndex:tagIndex];
    
    for (UIView *subview in self.view.subviews) {
        if (subview.tag == [tagString intValue]) {
            selectedView = subview;
            break;
        }
    }

    UIColor *holdColor = selectedView.backgroundColor;
    [UIView animateWithDuration:0.5 animations:^{
        selectedView.backgroundColor = [UIColor whiteColor];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            selectedView.backgroundColor = holdColor;
            
        } completion:^(BOOL finished) {
            if ([tagString isEqual:[tagArray lastObject]]) {
                return;
            }
            else {
                [self animateAllViewsFromTagArray:tagArray atIndex:tagIndex+1];
            }
        }];
        
    }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
