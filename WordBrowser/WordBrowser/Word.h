//
//  Word.h
//  WordBrowser
//
//  Created by Maria Merino on 7/25/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import <Foundation/Foundation.h>

@interface Word : NSObject
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *definition;
@property (strong, nonatomic)NSMutableArray *synonyms;

- (Word*) initWithName:(NSString*)aName andDefinition:(NSString*)aDefinition;

@end
