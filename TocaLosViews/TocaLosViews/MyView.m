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

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"MyView");
    }
    return self;
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Touched!!");
    self.backgroundColor = [UIColor yellowColor];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate didChooseView:self];
    NSLog(@"Tag = %i", self.tag);
    self.backgroundColor = [UIColor whiteColor];
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
