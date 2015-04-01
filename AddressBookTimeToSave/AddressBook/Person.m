//
//  Person.m
//  AddressBook
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstName;
@synthesize lastName;
@synthesize emailAddress;
@synthesize phoneNumber;

-(NSDictionary*)makeDictionary{
    Person *person = [[Person alloc] init];
    NSDictionary *personDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:person.firstName, @"firstName", person.lastName, @"lastName", person.emailAddress, @"email", person.phoneNumber, @"phoneNumber", nil];
    return personDictionary;
}

- (void) initWithDictionary:(NSDictionary *)personDictionary{
    firstName = [personDictionary objectForKey:@"firstName"];
    lastName = [personDictionary objectForKey:@"lastName"];
    emailAddress = [personDictionary objectForKey:@"email"];
    phoneNumber = [personDictionary objectForKey:@"phoneNumber"];
    
    //may need to change to return id - return person
    //return  person;
    
}

@end
