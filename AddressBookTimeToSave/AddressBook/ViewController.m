//
//  ViewController.m
//  AddressBook
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ShowViewController.h"
#import "EditViewController.h"

@interface ViewController (){
    NSMutableArray *people;
    IBOutlet UITableView *myTableView;
    int row;
    BOOL editAdd;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        people = [[NSMutableArray alloc] initWithCapacity:15];
        
        Person *andres = [[Person alloc] init];
        andres.firstName = @"Andres";
        andres.lastName = @"Pesate";
        andres.emailAddress = @"andres@gmail.com";
        andres.phoneNumber = @"999-999-9999";
        [people addObject:andres];
        
        Person *john = [[Person alloc] init];
        john.firstName = @"John";
        john.lastName = @"Smith";
        john.emailAddress = @"john@gmail.com";
        john.phoneNumber = @"888-888-8888";
        [people addObject:john];
        
        Person *sam = [[Person alloc] init];
        sam.firstName = @"Sam";
        sam.lastName = @"Iam";
        sam.emailAddress = @"sam@gmail.com";
        sam.phoneNumber = @"777-777-7777";
        [people addObject:sam];
        
        Person *mike = [[Person alloc] init];
        mike.firstName = @"Mike";
        mike.lastName = @"Krus";
        mike.emailAddress = @"mike@gmail.com";
        mike.phoneNumber = @"666-666-66666";
        [people addObject:mike];
        
        Person *tom = [[Person alloc] init];
        tom.firstName = @"Tom";
        tom.lastName = @"Bales";
        tom.emailAddress = @"tom@gmail.com";
        tom.phoneNumber = @"555-555-5555";
        [people addObject:tom];
    }
    return self;
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"my identifier"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my identifier"];
    }
    cell.textLabel.text = [[people objectAtIndex:indexPath.row]firstName];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [people count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toShowView" sender:self];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [people removeObjectAtIndex:indexPath.row];
    [myTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem*)sender{
    if ([segue.identifier isEqualToString:@"toAddPerson"]){
        //Adds Person
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.delegate = self;
        editAdd = YES;
    } else {
        //Edits Person
        ShowViewController * detailsViewController = segue.destinationViewController;
        row = [myTableView indexPathForSelectedRow].row;
        detailsViewController.delegate = self;
        detailsViewController.person = ((Person*)[people objectAtIndex:row]);
        editAdd = NO;
    } 
}

- (void) editRecord:(Person *)updatedPerson{
    
    if (editAdd == YES) {
        //Adds Person
        [people addObject:updatedPerson];
        [myTableView reloadData];
    }else {
        //Edits Person
        [people replaceObjectAtIndex:row withObject:updatedPerson];
        [myTableView reloadData];
    }
}
@end
