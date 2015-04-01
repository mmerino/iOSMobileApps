//
//  ViewController.m
//  API
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextView *textOutlet;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //NSURLResponse *response;
    //NSError *error;
    //NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
            NSLog(@"Inside the block");
        NSArray *superHeroArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSMutableString *superHeroString = [[NSMutableString alloc]init];
        [superHeroArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary *superHeroDictionary = (NSDictionary *)obj;
            NSString *name = [superHeroDictionary objectForKey:@"name"];
            NSString *description = [superHeroDictionary objectForKey:@"description"];
            [superHeroString appendFormat:@"%@: %@\n", name, description];
        }];
        //NSString *responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        //textOutlet.text = responseString;
        textOutlet.text = superHeroString;
    }];
    
    NSLog(@"After the block");
    [super viewDidLoad];
    //textOutlet.text = responseString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
