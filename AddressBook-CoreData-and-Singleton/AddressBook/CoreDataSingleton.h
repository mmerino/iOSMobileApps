//
//  CoreDataSingleton.h
//  AddressBook-NowItsPersonal
//
//  Created by Maria Merino on 8/8/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@interface CoreDataSingleton : NSObject

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (CoreDataSingleton *) sharedInstance;
- (NSArray *) fetchData;
- (NSManagedObjectContext*) managedObjectContext;

- (void) addManagedObject: (NSManagedObject *) managedObject;
- (void) removeManagedObject: (NSManagedObject *) managedObject;
- (void) editManagedObject: (NSManagedObject *) managedObject;

@end
