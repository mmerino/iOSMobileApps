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
        //self.backgroundColor = [UIColor redColor];
        UIImage *facebook = [UIImage imageNamed: @"facebook.png"];
        [self setImage:facebook];
    } else if (self.tag == 2){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor orangeColor];
        UIImage *flickr = [UIImage imageNamed: @"flickr.png"];
        [self setImage:flickr];
    } else if (self.tag == 3){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor yellowColor];
        UIImage *linkedin = [UIImage imageNamed: @"linkedin.png"];
        [self setImage:linkedin];
    } else if (self.tag == 4){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor greenColor];
        UIImage *pinterest = [UIImage imageNamed: @"pinterest.png"];
        [self setImage:pinterest];
    } else if (self.tag == 5){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor blueColor];
        UIImage *rss = [UIImage imageNamed: @"rss.png"];
        [self setImage:rss];
    } else if (self.tag == 6){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor purpleColor];
        UIImage *sharethis = [UIImage imageNamed: @"sharethis.png"];
        [self setImage:sharethis];
    } else if (self.tag == 7){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor grayColor];
        UIImage *twitter = [UIImage imageNamed: @"twitter.png"];
        [self setImage:twitter];
    } else if (self.tag == 8){
        [MyView transitionWithView:self duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
        //self.backgroundColor = [UIColor blackColor];
        UIImage *youtube = [UIImage imageNamed: @"youtube.png"];
        [self setImage:youtube];
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
