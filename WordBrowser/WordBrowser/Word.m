//
//  Word.m
//  WordBrowser
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "Word.h"

@implementation Word

@synthesize name;
@synthesize definition;

- (Word*) initWithName:(NSString*)aName andDefinition:(NSString*)aDefinition{
    
    Word *newWord = [[Word alloc] init];
    newWord.name = aName;
    newWord.definition = aDefinition;
    
    return newWord;
}

@end
