//
//  SecondViewController.h
//  BlocksChallenge
//
//  Created by Maria Merino on 7/23/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *filteredArray;

@end
