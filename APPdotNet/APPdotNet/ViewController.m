//
//  ViewController.m
//  APPdotNet
//
//  Created by Maria Merino on 7/26/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITableView *tableOutlet;
    NSArray *dataArray;
}
- (IBAction)refreshButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray count];
}

-(void) loadData{
    NSURL *url = [NSURL URLWithString: @"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *firstDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        dataArray = [firstDictionary objectForKey:@"data"];
        [tableOutlet reloadData];
    }];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"My Table"];
    
    NSDictionary *secondDictionary = [dataArray objectAtIndex:indexPath.row];
    NSString *text = [secondDictionary objectForKey:@"text"];
    
    NSDictionary *userDictionary = [secondDictionary objectForKey:@"user"];
    NSString *userName = [userDictionary objectForKey:@"username"];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"My Table"];
    }
    cell.textLabel.text = userName;
    cell.detailTextLabel.text = text;
    return cell;
}

- (IBAction)refreshButtonAction:(id)sender {
    [self loadData];
}
@end
