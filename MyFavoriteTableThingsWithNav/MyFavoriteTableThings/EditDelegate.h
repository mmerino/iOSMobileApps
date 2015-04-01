//
//  EditDelegate.h
//  MyFavoriteTableThingsWithNav
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <Foundation/Foundation.h>

@protocol EditDelegate <NSObject>

- (void) valueDidChange: (NSString *) value;

@end
