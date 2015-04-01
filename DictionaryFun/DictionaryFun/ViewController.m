//
//  ViewController.m
//  DictionaryFun
//
//  Created by Maria Merino on 7/24/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "Person.h"

@interface ViewController (){
    NSMutableDictionary *personDictionary;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    personDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    NSMutableArray *people = [NSMutableArray arrayWithCapacity:10];
    [super viewDidLoad];
    Person *personOne = [[Person alloc]init];
    Person *personTwo = [[Person alloc]init];
    Person *personThree = [[Person alloc]init];
    
    personOne.firstName = @"Don";
    personOne.lastName = @"Alberdi";
    personTwo.firstName = @"Andres";
    personTwo.lastName = @"Benger";
    personThree.firstName = @"Eddie";
    personThree.lastName = @"Kang";
    
    [people addObject:personTwo];
    [people addObject:personThree];
    
    [personDictionary setObject:people forKey:@"B"];
    [personDictionary setObject:personOne forKey:@"A"];
    
    [self describeDictionary:personDictionary];
}

- (void)describeDictionary: (NSDictionary*)dictionary{
    NSLog(@"Keys: %@", [dictionary allKeys]);
    NSLog(@"Values: %@", [dictionary allValues]);
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[Person class]]) {
            Person *person = (Person*)obj;
            NSLog(@"Name: %@ %@", ((Person*)obj).firstName, person.lastName);
        }else if ([obj isKindOfClass:[NSArray class]]){
            NSArray *array = (NSArray*)obj;
            [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                Person *person = (Person*)obj;
                NSLog(@"Name: %@ %@", ((Person*)obj).firstName, person.lastName);
            }];
        }
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
