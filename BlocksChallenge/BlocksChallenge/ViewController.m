//
//  ViewController.m
//  BlocksChallenge
//
//  Created by Maria Merino on 7/23/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    NSMutableArray *randomNumbers;
    NSMutableArray *evenNumbers;
    NSMutableArray *oddNumbers;
    SecondViewController *secondViewController;
}
- (IBAction)filterNumbers:(UIBarButtonItem*)sender;

@end

@implementation ViewController

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        randomNumbers = [NSMutableArray arrayWithCapacity:50];
        for (int i = 0; i<50; i++) {
            NSNumber *random = [NSNumber numberWithInt:arc4random()%10000];
            NSLog(@"%@",random);
            [randomNumbers addObject:random];
        }
        NSLog(@"array count %i",randomNumbers.count);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    evenNumbers = [[NSMutableArray alloc] init];
    oddNumbers = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    [randomNumbers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj intValue]%2 == 0){
            [evenNumbers addObject:obj];
            
        }else{
            [oddNumbers addObject:obj];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[randomNumbers objectAtIndex:indexPath.row]];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [randomNumbers count];
}

- (IBAction)filterNumbers:(UIBarButtonItem*)sender {
    [self performSegueWithIdentifier:@"toSecondView" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem*)sender{
    secondViewController = segue.destinationViewController;
    secondViewController.navigationItem.title = @"filtered results";
    
    NSLog(@"%i",sender.tag);
    if (sender.tag == 0) {
        secondViewController.filteredArray = oddNumbers;
    } else if (sender.tag == 1) {
        secondViewController.filteredArray = evenNumbers;
    } else {
        //threshold
    }
}
@end
