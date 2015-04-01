//
//  UIColorView.m
//  NotificationsCategoriesColors
//
//  Created by Maria Merino on 7/31/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "UIColorView.h"

@implementation UIColorView{
    NSString *test;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(newColor:) name:@"COLOR" object:nil];
    }
    return self;
}

- (void) newColor: (NSNotification *)notification{
    if ([notification.object isEqual: @"red"]){
        self.backgroundColor = [UIColor redColor];
    }else if([notification.object isEqual: @"blue"]){
        self.backgroundColor = [UIColor blueColor];
    }else if([notification.object isEqual: @"green"]){
        self.backgroundColor = [UIColor greenColor];
    }else if([notification.object isEqual: @"yellow"]){
        self.backgroundColor = [UIColor yellowColor];
    }else if([notification.object isEqual: @"purple"]){
            self.backgroundColor = [UIColor purpleColor];
    }else{
        self.backgroundColor = [UIColor lightGrayColor];
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
