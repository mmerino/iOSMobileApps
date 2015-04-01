//
//  ViewController.m
//  WordBrowser
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "Word.h"
#import "SecondViewController.h"

@interface ViewController (){
    Word *word0, *word1, *word2, *word3, *word4, *word5, *word6, *word7, *word8, *word9, *word10, *word11, *word12, *word13, *word14, *word15, *word16, *word17, *word18, *word19;
    
    NSMutableDictionary *wordsDictionary;
    NSMutableArray *keys;
    NSIndexPath *path;
}

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        wordsDictionary = [[NSMutableDictionary alloc] initWithCapacity:20];
        [self createWords];
        keys = [[NSMutableArray alloc] initWithArray:[wordsDictionary allKeys]];
        //NSLog(@"array: %@", wordsDictionary);
    }
    return self;
}

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

-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [keys objectAtIndex:indexPath.row];
    return cell;
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [wordsDictionary count];
}


- (void)createWords{
    for (int i = 0; i < 20; i++) {
        Word *newWord = [[Word alloc] initWithName:[NSString stringWithFormat:@"Word%i", i] andDefinition:[NSString stringWithFormat:@"Definition%i", i]];
        
        Word *synonym1 = [[Word alloc] initWithName:[NSString stringWithFormat:@"Synonym%ia", i] andDefinition:[NSString stringWithFormat:@"Synonym%ia Definition", i]];
        
        Word *synonym2 = [[Word alloc] initWithName:[NSString stringWithFormat:@"Synonym%ib", i] andDefinition:[NSString stringWithFormat:@"Synonym%ib Definition", i]];
        
        newWord.synonyms = [[NSMutableArray alloc] initWithObjects:synonym1, synonym2, nil];
        
        // Make it easier to read objects from newWord array "synonyms"
        synonym1 = (Word *)[newWord.synonyms objectAtIndex:0];
        synonym2 = (Word *)[newWord.synonyms objectAtIndex:1];
        
        //NSLog(@"\nWord: %@\nDefinition: %@\nFirst Synonym: %@\nFirst Synonym Definition: %@\nSecond Synonym: %@\nSecond Synonym Definition: %@", newWord.name, newWord.definition, synonym1.name, synonym1.definition, synonym2.name, synonym2.definition);
        [wordsDictionary setObject:newWord forKey:newWord.name];
        NSLog(@"Dictionary Count: %i", wordsDictionary.count);
    }
        
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    path = indexPath;
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"toSecondView"]) {
        SecondViewController * secondViewController = segue.destinationViewController;
        Word *newWord = [wordsDictionary objectForKey:[keys objectAtIndex:path.row]];
        Word *synonym1 = [newWord.synonyms objectAtIndex:0];
        Word *synonym2 = [newWord.synonyms objectAtIndex:1];
        
        secondViewController.incomingDefinition = [NSString stringWithFormat:@"%@ \n%@ \n%@",newWord.definition, synonym1.name, synonym2.name];
    }
}

@end
