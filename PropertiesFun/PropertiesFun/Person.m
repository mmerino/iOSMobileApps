//
//  Person.m
//  PropertiesFun
//
//  Created by Maria Merino on 7/12/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "Person.h"

@implementation Person

@synthesize name;

-(void) setName:(NSString *)_name{
    name = [NSString stringWithFormat: @"%@!", _name];
}

@end
