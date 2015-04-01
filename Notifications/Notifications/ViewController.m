//
//  ViewController.m
//  Notifications
//
//  Created by Maria Merino on 7/31/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UILabel *labelOne;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [super viewDidLoad];
    labelOne.text = @"0";
    NSLog(@"%@", notificationCenter);
    
    [notificationCenter addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self incrementCount];
    }];
    
    [notificationCenter addObserver:self selector:@selector(incrementCount) name:@"TouchNotification" object:nil];
}

-(void)incrementCount {
    NSInteger count = labelOne.text.integerValue;
    count++;
    labelOne.text = [NSString stringWithFormat:@"%i", count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
