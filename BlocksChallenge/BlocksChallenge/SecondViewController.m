//
//  SecondViewController.m
//  BlocksChallenge
//
//  Created by Maria Merino on 7/23/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "SecondViewController.h"

@interface SecondViewController (){
}

@end

@implementation SecondViewController

@synthesize filteredArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
    //NSLog(@"array: %@", filteredArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[filteredArray objectAtIndex:indexPath.row]];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [filteredArray count];
}

@end
