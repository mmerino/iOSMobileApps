//
//  SubclassOfUIView.m
//  Notifications
//
//  Created by Maria Merino on 7/31/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "SubclassOfUIView.h"

@implementation SubclassOfUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSLog(@"%@",notificationCenter);
    [notificationCenter postNotificationName:@"TouchNotification" object:nil];
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
