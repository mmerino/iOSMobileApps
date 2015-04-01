//
//  MyView.m
//  TocaLosViews
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "MyView.h"
#import "MatchDelegate.h"

@implementation MyView

@synthesize delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"MyView");
    }
    return self;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate didChooseView:self];
    //NSLog(@"Tag = %i", self.tag);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (self.tag == 1) {
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor redColor];
    } else if (self.tag == 2){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor orangeColor];
    } else if (self.tag == 3){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor yellowColor];
    } else if (self.tag == 4){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor greenColor];
    } else if (self.tag == 5){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor blueColor];
    } else if (self.tag == 6){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor purpleColor];
    } else if (self.tag == 7){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor grayColor];
    } else if (self.tag == 8){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        self.backgroundColor = [UIColor blackColor];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
