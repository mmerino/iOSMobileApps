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
    int row;
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


#pragma mark UITableViewDataSource
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

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    SecondViewController * editViewController;
    editViewController = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    editViewController.textValue = [array objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:editViewController animated:YES];
    editViewController.delegate = self;
    row = indexPath.row;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [array removeObjectAtIndex:indexPath.row];
    [myTableView reloadData];
}

- (IBAction)addText:(id)sender {
    if (![myTextField.text isEqual:@""]) {
        [array addObject:myTextField.text];
        [myTableView reloadData];
        [myTextField resignFirstResponder];
    }
}

- (void) valueDidChange:(NSString *)value{
    [array replaceObjectAtIndex:row withObject:value];
    [myTableView reloadData];
}
@end
