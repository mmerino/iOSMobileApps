//
//  ViewController.m
//  To-Do_List
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    __weak IBOutlet UITableView *myTableView;
    __weak IBOutlet UITextField *myTextField;
    NSMutableArray * array;
}
- (IBAction)addText:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [NSMutableArray arrayWithCapacity:10];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate
-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"my identifier"];
    //myTableView.editing = YES;
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my identifier"];
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    return cell;
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    myTextField.text = @"YES"; //replace with something that opens second view that allows you to edit the cell detail at indexPath
}

- (IBAction)addText:(id)sender {
    if (![myTextField.text isEqual:@""]) {
        [array addObject:myTextField.text];
        [myTableView reloadData];
        [myTextField resignFirstResponder];
    }
}
@end
