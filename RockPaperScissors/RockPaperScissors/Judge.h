//
//  Judge.h
//  RockPaperScissors
//
//  Created by Maria Merino on 7/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <Foundation/Foundation.h>

@interface Judge : NSObject

-(BOOL) didComputerWin:(NSString *)computerText didPlayerWin:(NSString *)playerText;

@end
