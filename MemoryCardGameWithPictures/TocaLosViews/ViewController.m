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
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstPick = YES;
    numberOfMatches = 0;
    
    resetArray = [NSMutableArray array];
    for (int i = 1; i<9; i++) {
        [resetArray addObject:[NSNumber numberWithInt:i]];
        [resetArray addObject:[NSNumber numberWithInt:i]];
    }
    //resetArray = [[NSMutableArray alloc]initWithArray:numberArray];
    NSLog(@"resetArray: %@", resetArray);
    
    for (UIView *subview in self.view.subviews){
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
/*-(void) shuffleCards{
    int randomIndexSelected = random()%(16-numberOfRemovedObjects);   // added
    
    MyView * myView = (MyView*)subview;
    
    myView.tag = [[resetArray objectAtIndex:randomIndexSelected] intValue];
    
    [resetArray removeObjectAtIndex:randomIndexSelected]; // added
    
    numberOfRemovedObjects++;
}*/

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
            firstPick = NO;
        }else{
            if (storeFirstPick == myview.tag) {
                usleep(500000); //replace this with a system timer later!
                NSLog(@"Match Made!");
                firstPick = YES;
                numberOfMatches++;
                for (UIView *subview in self.view.subviews){
                    if ([subview isKindOfClass:[MyView class]]) {
                        MyView * oldSelection = (MyView*)subview;
                        if(oldSelection.tag == storeFirstPick){
                            if (numberOfMatches == 8){
                                usleep(300000);
                                numberOfRemovedObjects = 0;
                                NSLog(@"ResetArray: %@, Removed: %i",resetArray, numberOfRemovedObjects);
                                [self recreateArray];
                                //resetArray = numberArray;
                                NSLog(@"ResetArray: %@, Removed: %i",resetArray, numberOfRemovedObjects);
                                for (MyView *myview in self.view.subviews) {
                                    [MyView transitionWithView:myview duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                                    myview.backgroundColor = [UIColor whiteColor];
                                    //This is the part that Randomizes!
                                    int randomIndexSelected = random()%(16-numberOfRemovedObjects);   // added
                                    myview.tag = [[resetArray objectAtIndex:randomIndexSelected] intValue];
                                    [resetArray removeObjectAtIndex:randomIndexSelected];
                                    numberOfRemovedObjects++;
                                }
                                numberOfMatches = 0;
                                storedFirstChoice = nil;
                            }
                        }
                    }
                }
                
            }else{
                usleep(1000000); //replace this with a system timer later!
                NSLog(@"Did Not Match!");
                firstPick = YES;
                [MyView transitionWithView:storedFirstChoice duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                myview.backgroundColor = [UIColor whiteColor];
                for (UIView *subview in self.view.subviews){
                    if ([subview isKindOfClass:[MyView class]]) {
                        MyView * oldSelection = (MyView*)subview;
                        if(oldSelection.tag == storeFirstPick){
                            [MyView transitionWithView:myview duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
                            oldSelection.backgroundColor = [UIColor whiteColor];
                            storedFirstChoice = nil;
                        }
                    }
                }
            }
        }
        //NSLog(@"%i", storeFirstPick);
    }
}

@end