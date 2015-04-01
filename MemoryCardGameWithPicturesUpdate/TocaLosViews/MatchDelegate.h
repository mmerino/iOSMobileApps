//
//  MatchDelegate.h
//  TocaLosViews
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import <Foundation/Foundation.h>

@class MyView;

@protocol MatchDelegate <NSObject>

- (void) didChooseView: (MyView *)myview;

@end
