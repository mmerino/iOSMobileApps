//
//  StopsAnnotationView.m
//  MappingMapping
//
//  Created by Maria Merino on 7/31/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "StopsAnnotationView.h"

@implementation StopsAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image = [UIImage imageNamed:@"yellow"];
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(newColor:) name:@"COLOR" object:nil];
    }
    return self;
}

- (void) newColor: (NSNotification *)notification{
    if ([notification.object isEqual: @"red"]){
        self.image = [UIImage imageNamed:@"red"];
    }else if([notification.object isEqual: @"blue"]){
        self.image = [UIImage imageNamed:@"blue"];
    }else if([notification.object isEqual: @"green"]){
        self.image = [UIImage imageNamed:@"green"];
    }else {
        self.image = [UIImage imageNamed:@"yellow"];
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"COLOR" object:nil];
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
