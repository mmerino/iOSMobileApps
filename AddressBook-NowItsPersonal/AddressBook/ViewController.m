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
#import "AppDelegate.h"

@interface ViewController (){
    NSMutableArray *people;
    NSMutableArray *peopleBackup;
    IBOutlet UITableView *myTableView;
    int row;
    BOOL editAdd;
    NSManagedObjectContext *managedObjectContext;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    managedObjectContext = ((AppDelegate*) [UIApplication sharedApplication].delegate).managedObjectContext;
    people = [[NSMutableArray alloc] initWithCapacity:10];
    peopleBackup = [[NSMutableArray alloc] initWithCapacity:15];
    NSError *error;
    
    if ([people count] == 0) {
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
        person.firstName = @"Core";
        person.lastName = @"Data";
        person.emailAddress = @"cdEmail@email.com";
        person.phoneNumber = @"number";
        [people addObject:person];
        [managedObjectContext save:&error];
        
    }else{
        NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
        NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
        NSFetchedResultsController *fetchedResultsController;
        NSError* error;
        NSSortDescriptor *sortDescriptor;
        NSArray *sortsDescriptors;
        
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        sortsDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        
        [fetchRequest setEntity:entityDescription];
        [fetchRequest setSortDescriptors:sortsDescriptors];
        
        fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        [fetchedResultsController performFetch:&error];
    }
    
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
    Person *person = [people objectAtIndex:indexPath.row];
    cell.textLabel.text = person.firstName;
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
        [peopleBackup addObject:updatedPerson];
        [myTableView reloadData];
    }else {
        //Edits Person
        [peopleBackup replaceObjectAtIndex:row withObject:updatedPerson];
        [myTableView reloadData];
    }
}
@end
