//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Maria Merino on 7/19/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "AppDelegate.h"
#import "Person.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
    NSMutableArray * coreDataPeople;
    NSFileManager *fileManager;
    NSURL *documentsDirectory;
    NSManagedObjectContext *managedObjectContext;
    int path;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];
    managedObjectContext = ((AppDelegate*) [UIApplication sharedApplication].delegate).managedObjectContext;
    [super viewDidLoad];
    
    coreDataPeople = [[NSMutableArray alloc] initWithCapacity:50];
    fileManager = [NSFileManager defaultManager];
    documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    NSLog(@"%@",documentsDirectory.path);
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"gotStuff"]) {
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             people = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             [people writeToURL:[documentsDirectory URLByAppendingPathComponent:@"people.plist"] atomically:YES];
             
             
             //if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasData"]){
                 for (NSDictionary *dictionary in people) {
                     Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
                     
                     NSURL *url = [NSURL URLWithString:[dictionary valueForKey:@"avatar_url"]];
                     NSData *data = [NSData dataWithContentsOfURL:url];
                     NSString *imageFileName = [[url pathComponents]lastObject];
                     NSURL *localImageURL = [documentsDirectory URLByAppendingPathComponent: imageFileName];
                     
                     person.name = [dictionary valueForKey:@"name"];
                     person.superDescription = [dictionary valueForKey:@"description"];
                     person.image = [localImageURL absoluteString];
                     [coreDataPeople addObject:person];
                     
                     if (![fileManager fileExistsAtPath:[localImageURL path]]) {
                         [data writeToURL:localImageURL atomically:YES];
                     }
                     
                 }
             //}
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasData"];
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"gotStuff"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             if (![managedObjectContext save:&error]) {
                 NSLog(@"Error %@", error );
             }
             
             [oTableView reloadData];
         }];
    } else {
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
        
        coreDataPeople = fetchedResultsController.fetchedObjects;
        
        
        //people = [NSArray arrayWithContentsOfURL: [documentsDirectory URLByAppendingPathComponent:@"people.plist"]];
        //NSLog(@"%@",people);
        //[oTableView reloadData];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [coreDataPeople count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [coreDataPeople objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:person.image];
    NSString *imageFileName = [[url pathComponents]lastObject];
    NSURL *localImageURL = [documentsDirectory URLByAppendingPathComponent: imageFileName];
    NSData *data = [NSData dataWithContentsOfURL:localImageURL];

    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Superhero" forIndexPath:indexPath];
    
    tableViewCell.textLabel.text = person.name;
    tableViewCell.detailTextLabel.text = person.superDescription;
    tableViewCell.imageView.image = [UIImage imageWithData:data];
    
    
    return tableViewCell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    path = indexPath.row;
    [self performSegueWithIdentifier:@"toSecondViewController" sender:self];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *secondViewController = segue.destinationViewController;
    Person* person = [coreDataPeople objectAtIndex:path];
    secondViewController.hero = person;
}

-(void)viewDidAppear:(BOOL)animated{
    [oTableView reloadData];
}

@end
