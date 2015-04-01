//
//  ViewController.m
//  MemoryManagment
//
//  Created by Maria Merino on 7/18/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController (){
    NSMutableArray * myArray;
    NSObject * myObject;
}
- (IBAction)memoryTest:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    myObject = [[NSObject alloc]init];
    myArray = [NSMutableArray arrayWithCapacity:5];
    NSLog(@"RetainCount = %i", [myObject retainCount]);
    [myObject retain];
    NSLog(@"RatainCount = %i", [myObject retainCount]);
    [myArray addObject:myObject];
    NSLog(@"RatainCount = %i", [myObject retainCount]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)memoryTest:(id)sender {
    NSLog(@"RatainCount = %i", [myObject retainCount]);
    NSLog(@"Array RatainCount = %i", [myArray retainCount]);
}
@end
