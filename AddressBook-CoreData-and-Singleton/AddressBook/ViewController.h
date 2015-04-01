//
//  ViewController.h
//  AddressBook
//
//  Created by Maria Merinoon 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavePerson.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SavePerson>

@end
