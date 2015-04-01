//
//  ViewController.m
//  API
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    __weak IBOutlet UITableView *tableOutlet;
    NSArray *superHeroArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSString *part = [NSString stringWithFormat:@"lemons"];
    //NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"];
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?%%20action=query&list=search&srsearch=%@&srprop=snippet&format=json",part]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        superHeroArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        [tableOutlet reloadData];
    }];
    
    [super viewDidLoad];
}
-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"My Table"];
    NSDictionary *superHeroDictionary = (NSDictionary *) [superHeroArray objectAtIndex:indexPath.row];
    NSString *name = [superHeroDictionary objectForKey:@"name"];
    NSString *description = [superHeroDictionary objectForKey:@"description"];
    UIImage *image;
    NSURL *url = [NSURL URLWithString:[superHeroDictionary objectForKey:@"avatar_url"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    image = [UIImage imageWithData:data];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"My Table"];
    }
    cell.textLabel.text = name;
    cell.detailTextLabel.text = description;
    cell.imageView.image = image;
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [superHeroArray count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
