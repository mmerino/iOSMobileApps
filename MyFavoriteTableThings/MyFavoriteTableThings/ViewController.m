//
//  ViewController.m
//  MyFavoriteTableThings
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import "ViewController.h"

@interface ViewController (){
    __weak IBOutlet UITableView *myTableView;
    __weak IBOutlet UITextField *myTextField;
    NSMutableArray * array;
}
- (IBAction)addText:(id)sender;
- (IBAction)removeText:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my identifier"];
    }
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}

- (IBAction)addText:(id)sender {
    if (![myTextField.text isEqual:@""]) {
        [array addObject:myTextField.text];
        [myTableView reloadData];
        [myTextField resignFirstResponder];
    }
}

- (IBAction)removeText:(id)sender {
    [array removeLastObject];
    [myTableView reloadData];
    [myTextField resignFirstResponder];
}

@end
