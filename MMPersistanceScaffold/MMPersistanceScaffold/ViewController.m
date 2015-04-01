//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
    
    NSFileManager *fileManager;
    
    NSURL *documentsDirectory;
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];
    
    [super viewDidLoad];
    
    fileManager = [NSFileManager defaultManager];
    documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"%@", documentsDirectory.path);
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"hasData"]) {        
        people = [NSArray arrayWithContentsOfURL:[documentsDirectory URLByAppendingPathComponent:@"people.plist"]];
        NSLog(@"in the else");
    }
    
    else {
        
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             people = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             [people writeToURL:[documentsDirectory URLByAppendingPathComponent:@"people.plist"] atomically:YES];
             for (NSDictionary *dictionary in people) {
                 
                 NSURL *url = [NSURL URLWithString:[dictionary valueForKey:@"avatar_url"]];
                 NSData *data = [NSData dataWithContentsOfURL:url];
                 NSString *imageFileName = [[url pathComponents] lastObject];
                 NSURL* localImageURL = [documentsDirectory URLByAppendingPathComponent:imageFileName];
                 
                 if (![fileManager fileExistsAtPath:[localImageURL path]]) {
                     [data writeToURL:localImageURL atomically:YES];
                 }
             }
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasData"];
             [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"Date"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             [oTableView reloadData];
         }
         ];
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
    return [people count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSURL *url = [NSURL URLWithString:[[people objectAtIndex:indexPath.row]valueForKey:@"avatar_url"] ];
    NSString* imageFileName = [[url pathComponents] lastObject];
    NSURL* localImageURL = [documentsDirectory URLByAppendingPathComponent:imageFileName];
    NSData *data = [NSData dataWithContentsOfURL:localImageURL];
    
    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Superhero" forIndexPath:indexPath];
    
    tableViewCell.textLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"name"];
    tableViewCell.detailTextLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"description"];
    tableViewCell.imageView.image = [UIImage imageWithData:data];
    
    
    
    return tableViewCell;
}


@end
