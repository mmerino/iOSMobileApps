//
//  ViewController.m
//  Singleton
//
//  Created by Maria Merino on 8/9/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "MySingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSArray *array1 = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10]; // shortcut for NSNumber numberWithInt:
    NSArray *array2 = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0); // returns main queue (global is sysnonymous with main)
    [super viewDidLoad];
    
    dispatch_async(queue, ^{
        [array1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [[MySingleton sharedInstance] describe];
            NSLog(@"Element Array 1: %@",obj);
            //sleep(arc4random() %5);
        }];
    });
    dispatch_async(queue, ^{
        [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [[MySingleton sharedInstance] describe];
            NSLog(@"Element Array 2: %@",obj);
            //sleep(arc4random() %5);
        }];
    });
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
