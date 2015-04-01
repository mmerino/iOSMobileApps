//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Maria Merino on 7/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "Judge.h"

@interface ViewController ()
{
    NSArray*                choices;
    NSTimer*                timer;
    int                     count;
    

    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}
- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
@end

@implementation ViewController

-(void)showWinner
{
    BOOL computerWon;
    
    //computerWon = TRUE;
    
    Judge * dredd;
    dredd = [[Judge alloc]init];
    
    computerWon = [dredd didComputerWin:computerHandLabel.text didPlayerWin:playerHandLabel.text];
    
    
    if (computerWon) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
    }
    else{
        playerHandLabel.backgroundColor = [UIColor greenColor];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    choices = @[@"rock", @"paper", @"scissors"];
    count = 3;
    [self updateCount];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    count--;
    [self updateCount];
    
    if (count == 0) {
        [timer invalidate];
        count = 4;
        computerHandLabel.text = [choices objectAtIndex:arc4random() % 3];
        [self showWinner];
    }
}


- (IBAction)start:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.backgroundColor = [UIColor whiteColor];

}

- (IBAction)rock:(id)sender
{
    playerHandLabel.text = @"rock";
    //[self showWinner];
}

- (IBAction)paper:(id)sender
{
    playerHandLabel.text = @"paper";
    //[self showWinner];
}

- (IBAction)scissors:(id)sender
{
    playerHandLabel.text = @"scissors";
    //[self showWinner];
}


@end
