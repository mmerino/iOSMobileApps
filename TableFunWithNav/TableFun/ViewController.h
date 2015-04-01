//
//  ViewController.h
//  TableFun
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "EditDelegate.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditDelegate>

@end
