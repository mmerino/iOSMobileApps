//
//  SecondViewController.h
//  To-Do_List
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <UIKit/UIKit.h>
#import "Ghost.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSString * textValue;
@property (strong, nonatomic) id <Ghost> delegate;

@end
