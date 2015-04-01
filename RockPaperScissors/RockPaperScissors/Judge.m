//
//  Judge.m
//  RockPaperScissors
//
//  Created by Maria Merino on 7/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "Judge.h"

@implementation Judge

-(BOOL) didComputerWin:(NSString *)computerText didPlayerWin:(NSString *)playerText{
    
NSLog (@"Here is   %@, AND  %@ ", computerText, playerText);
    
    if ([computerText isEqualToString: @"scissors"] && [playerText isEqualToString:@"paper"]){
        return YES;
    }else if ([computerText isEqualToString: @"paper"] && [playerText isEqualToString:@"rock"]){
        return YES;
    }else if ([computerText isEqualToString: @"rock"] && [playerText isEqualToString:@"scissors"]){
        return YES;
    }else if ([computerText isEqualToString: @"scissors"] && [playerText isEqualToString:@"rock"]){
        return NO;
    }else if ([computerText isEqualToString: @"paper"] && [playerText isEqualToString:@"scissors"]){
        return NO;
    }else if ([computerText isEqualToString: @"rock"] && [playerText isEqualToString:@"paper"]){
        return NO;
    }else if ([computerText isEqualToString: @"rock"] && [playerText isEqualToString:@"rock"]){
        return NO;
    }else if ([computerText isEqualToString: @"paper"] && [playerText isEqualToString:@"paper"]){
        return NO;
    }else{
        return NO;
    }
} 

@end
