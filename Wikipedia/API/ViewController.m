//
//  ViewController.m
//  API
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController (){
    __weak IBOutlet UITextField *searchBar;
    __weak IBOutlet UITableView *tableOutlet;
    NSArray *searchArray;
}
- (IBAction)goButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"My Table"];
    
    NSDictionary *searchResults = (NSDictionary *)[searchArray objectAtIndex:indexPath.row];
    NSString *title = [searchResults objectForKey:@"title"];
    //NSString *snippet = [searchResults objectForKey:@"snippet"];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"My Table"];
    }
    cell.textLabel.text = title;
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [searchArray count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonAction:(id)sender {
    
    NSString *part = searchBar.text;
    part = [part stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    
    //could use NSMutableString - allows you to change string
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?%%20action=query&list=search&srsearch=%@&srprop=snippet&format=json",part]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *firstDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary *query= [firstDictionary objectForKey:@"query"];
        searchArray = [query objectForKey:@"search"];
        
        [tableOutlet reloadData];
    }];
    [searchBar resignFirstResponder];
}
@end

















