//
//  ViewController.m
//  TableFun
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextField *myTextField;
    NSMutableArray * array;
    __weak IBOutlet UITableView *myTableView;
    
}
- (IBAction)changeLabel:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    array = [NSMutableArray arrayWithCapacity:10];
    [array addObject:@"red"];
    [array addObject:@"green"];
    [array addObject:@"blue"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabel:(id)sender {
    [array addObject:myTextField.text];
    [myTableView reloadData];
    [myTextField resignFirstResponder];
}

#pragma mark UITableViewDataSource
-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"my identifier"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my identifier"];
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}

#pragma mark UITableViewDelegate
@end
