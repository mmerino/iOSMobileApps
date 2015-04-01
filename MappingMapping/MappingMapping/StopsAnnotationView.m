//
//  StopsAnnotationView.m
//  MappingMapping
//
//  Created by Maria Merino on 7/30/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "StopsAnnotationView.h"

@implementation StopsAnnotationView

- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"HAPPY!");
        //self.image = [
    }
    return self;
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
