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
//#import "EditViewController.h"
#import "AppDelegate.h"

@interface ViewController (){
    NSMutableArray *people;
    NSMutableArray *peopleBackup;
    IBOutlet UITableView *myTableView;
    int row;
    BOOL editAdd;
    NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Address Book";
    managedObjectContext = ((AppDelegate*) [UIApplication sharedApplication].delegate).managedObjectContext;
    people = [[NSMutableArray alloc] initWithCapacity:10];
    
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSError* error;
    NSSortDescriptor *sortDescriptor;
    NSArray *sortsDescriptors;
    
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    sortsDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setSortDescriptors:sortsDescriptors];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    [self.fetchedResultsController performFetch:&error];
    self.fetchedResultsController.delegate = self;
    people = [self.fetchedResultsController.fetchedObjects mutableCopy];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    //cell.textLabel.text = person.firstName;
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [people count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toShowView" sender:self];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSError *error;
    [managedObjectContext deleteObject:[people objectAtIndex:indexPath.row]];
    [people removeObjectAtIndex:indexPath.row];
    [myTableView reloadData];
    
    if(![managedObjectContext save:&error]){
        NSLog(@"Error = %@", [error userInfo]);
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem*)sender{
    if ([segue.identifier isEqualToString:@"toAddPerson"]){
        //Adds Person
        editAdd = YES;
        EditViewController *editViewController = segue.destinationViewController;
        editViewController.delegate = self;
        editViewController.editAdd = editAdd;
    } else {
        //Edits Person
        editAdd = NO;
        ShowViewController * showViewController = segue.destinationViewController;
        row = [myTableView indexPathForSelectedRow].row;
        showViewController.delegate = self;
        showViewController.person = ((Person*)[people objectAtIndex:row]);
        showViewController.editAdd = editAdd;
    }
}   

//NOT NEEDED --- NO DELEGATE
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

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    people = [[controller fetchedObjects] mutableCopy];
    [myTableView reloadData];
}

//-(void)viewDidAppear:(BOOL)animated{
//    [myTableView reloadData];
//}
@end
