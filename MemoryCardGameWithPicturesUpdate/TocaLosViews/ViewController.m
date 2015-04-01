//
//  ViewController.m
//  TocaLosViews
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.



#import "ViewController.h"
#import "MyView.h"

@interface ViewController (){
    BOOL firstPick;
    int storeFirstPick;
    int numberOfMatches;
    MyView *storedFirstChoice;
    NSMutableArray *numberArray;
    NSMutableArray *resetArray;
    int numberOfRemovedObjects;
    __weak IBOutlet UILabel *labelWinLoss;
}

- (IBAction)resetButtonAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    labelWinLoss.text = @"";
    firstPick = YES;
    numberOfMatches = 0;
    
    resetArray = [NSMutableArray array];
    for (int i = 1; i<9; i++) {
        [resetArray addObject:[NSNumber numberWithInt:i]];
        [resetArray addObject:[NSNumber numberWithInt:i]];
    }
    NSLog(@"resetArray: %@", resetArray);
    
    for (UIImageView *subview in self.view.subviews){
        if ([subview isKindOfClass:[MyView class]]) {
            MyView * myView = (MyView*)subview;
            myView.delegate = self;

            int randomIndexSelected = random()%(16-numberOfRemovedObjects);
            myView.tag = [[resetArray objectAtIndex:randomIndexSelected] intValue];
            [resetArray removeObjectAtIndex:randomIndexSelected];
            numberOfRemovedObjects++;
        }
    }
    NSLog(@"Removed: %i", numberOfRemovedObjects);
}

- (void)recreateArray{
    for (int i = 1; i<9; i++) {
        [resetArray addObject:[NSNumber numberWithInt:i]];
        [resetArray addObject:[NSNumber numberWithInt:i]];
    }
    NSLog(@"numberArray: %@", resetArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didChooseView: (MyView *)myview{
    if (myview != storedFirstChoice){
        if (firstPick) {
            storeFirstPick = myview.tag;
            storedFirstChoice = myview;
            labelWinLoss.text = @"";
            firstPick = NO;
        }else{
            if (storeFirstPick == myview.tag) {
                labelWinLoss.text = @"Match Made!";
                firstPick = YES;
                numberOfMatches++;
                usleep(500000); //replace this with a system timer later!
                for (UIImageView *subview in self.view.subviews){
                    if ([subview isKindOfClass:[MyView class]]) {
                        MyView * oldSelection = (MyView*)subview;
                        if(oldSelection.tag == storeFirstPick){
                            if (numberOfMatches == 8){
                                labelWinLoss.text = @"You Win!";
                                numberOfRemovedObjects = 0;
                                [self recreateArray];
                                usleep(600000);
                                for (MyView *myview in self.view.subviews) {
                                    if ([myview isKindOfClass:[MyView class]]) {
                                        [MyView transitionWithView:myview duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                                        myview.backgroundColor = [UIColor whiteColor];
                                        myview.image = nil;
                                        //This is the part that Randomizes!
                                        int randomIndexSelected = random()%(16-numberOfRemovedObjects);   // added
                                        myview.tag = [[resetArray objectAtIndex:randomIndexSelected] intValue];
                                        [resetArray removeObjectAtIndex:randomIndexSelected];
                                        numberOfRemovedObjects++;
                                    }
                                }
                                //labelWinLoss.text = @"";
                                numberOfMatches = 0;
                                storedFirstChoice = nil;
                            }
                        }
                    }
                }
                
            }else{
                usleep(1000000); //replace this with a system timer later!
                labelWinLoss.text = @"Not a Match";
                firstPick = YES;
                [MyView transitionWithView:storedFirstChoice duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                myview.backgroundColor = [UIColor whiteColor];
                for (UIImageView *subview in self.view.subviews){
                    if ([subview isKindOfClass:[MyView class]]) {
                        MyView * oldSelection = (MyView*)subview;
                        if(oldSelection.tag == storeFirstPick){
                            [MyView transitionWithView:myview duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                            oldSelection.backgroundColor = [UIColor whiteColor];
                            myview.image = nil;
                            oldSelection.image = nil;
                            storedFirstChoice = nil;
                        }
                    }
                }
            }
        }
    }
}

- (IBAction)resetButtonAction:(id)sender {
    numberOfRemovedObjects = 0;
    NSLog(@"ResetArray: %@, Removed: %i",resetArray, numberOfRemovedObjects);
    [self recreateArray];
    NSLog(@"ResetArray: %@, Removed: %i",resetArray, numberOfRemovedObjects);
    for (MyView *myview in self.view.subviews) {
        if ([myview isKindOfClass:[MyView class]]) {
            [MyView transitionWithView:myview duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
            myview.backgroundColor = [UIColor whiteColor];
            myview.image = nil;
            //This is the part that Randomizes!
            int randomIndexSelected = random()%(16-numberOfRemovedObjects);   // added
            myview.tag = [[resetArray objectAtIndex:randomIndexSelected] intValue];
            [resetArray removeObjectAtIndex:randomIndexSelected];
            numberOfRemovedObjects++;
        }
    }
    numberOfMatches = 0;
    storedFirstChoice = nil;
    labelWinLoss.text = @"";
    
}
@end