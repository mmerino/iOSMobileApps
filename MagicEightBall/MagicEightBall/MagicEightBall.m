//
//  MagicEightBall.m
//  MagicEightBall
//
//  Created by Maria Merino on 7/10/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "MagicEightBall.h"

@implementation MagicEightBall
-(NSString*) getRandomString:(NSString *)randString;{
    
    randString = @"lemons";
    int x = arc4random() % 3;
    
    if (x == 1) {
        randString = @"answer 1";
    }else if (x == 2){
        randString = @"answer 2";
    }else{
        randString = @"answer 3";
    }

    return randString;
}

@end
