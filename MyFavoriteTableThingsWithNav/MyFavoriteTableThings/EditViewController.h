//
//  EditViewController.h
//  MyFavoriteTableThingsWithNav
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <UIKit/UIKit.h>
#import "EditDelegate.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) NSString * textValue;
@property (strong, nonatomic) id <EditDelegate> delegate;

@end
