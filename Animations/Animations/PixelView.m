//
//  PixelView.m
//  Animations
//
//  Created by Maria Merino on 8/1/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "PixelView.h"

@implementation PixelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //UITouch *touch = [touches anyObject];
    //CGPoint point = [touch locationInView:self.superview];
    
    /*CGSize bounds = self.superview.bounds.size;
    int boundW = (int)ceilf(bounds.width);
    float randWidth = arc4random()%boundW;
    if (randWidth < self.frame.size.width/2) {
        randWidth = self.frame.size.width/2;
    }else if (randWidth > randWidth - self.frame.size.width/2){
        randWidth = randWidth - self.frame.size.width/2;
    }else{
        
    }
    
    int boundH = (int)ceilf(bounds.height);
    float randHeight = arc4random()%boundH;
    if (randHeight < self.frame.size.height/2) {
        randHeight = self.frame.size.height/2;
    }else if (randHeight > randHeight - self.frame.size.height/2){
        randHeight = randHeight - self.frame.size.height/2;
    }else{
     
    }*/
    
    int x = arc4random() % (int)(self.superview.frame.size.width - self.frame.size.width) + self.frame.size.width/2;
    int y = arc4random() % (int)(self.superview.frame.size.height - self.frame.size.height) + self.frame.size.height/2;
    
    
    [UIView animateWithDuration:0.1 animations:^{
        //self.center = CGPointMake(randWidth, randHeight);
        self.center = CGPointMake(x, y);
        if (self.backgroundColor == [UIColor redColor]){
            self.backgroundColor = [UIColor whiteColor];
        } else {
            self.backgroundColor = [UIColor redColor];
        }
    }];
}

/*- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    
    float randWidth = arc4random()%295;
    float randHeight = arc4random()%515;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.center = CGPointMake(randWidth, randHeight);
        self.backgroundColor = [UIColor redColor];
    }];
    
}*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
