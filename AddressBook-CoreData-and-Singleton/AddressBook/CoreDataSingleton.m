//
//  CoreDataSingleton.m
//  AddressBook-NowItsPersonal
//
//  Created by Maria Merino on 8/8/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "CoreDataSingleton.h"

@interface CoreDataSingleton ()

- (void) coreDataSetup;

@end

@implementation CoreDataSingleton{
    NSManagedObjectContext *managedObjectContext;
}

@synthesize managedObjectModel, persistentStoreCoordinator, managedObjectContext;

static CoreDataSingleton * sCoreDataSingleton;


+ (CoreDataSingleton *) sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sCoreDataSingleton = [[CoreDataSingleton alloc] init];
        [sCoreDataSingleton coreDataSetup];
    });
    
    return sCoreDataSingleton;
}

- (void) coreDataSetup{
    NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSURL *sqliteURL = [documentsDirectory URLByAppendingPathComponent:@"Model.sqlite"];
    NSError *error;
    
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    if ([persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:&error]) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
}

- (NSManagedObjectContext*) managedObjectContext{
    NSManagedObjectContext *passManagedObjectContext = [[NSManagedObjectContext alloc] init];
    passManagedObjectContext = managedObjectContext;
    return passManagedObjectContext;
}


- (NSArray *) fetchData{
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSFetchedResultsController *fetchedResultsController;
    NSError* error;
    NSSortDescriptor *sortDescriptor;
    NSArray *sortsDescriptors;
    
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    sortsDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    
    [fetchRequest setEntity:entityDescription];
    [fetchRequest setSortDescriptors:sortsDescriptors];
    
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    [fetchedResultsController performFetch:&error];
    return fetchedResultsController.fetchedObjects;
}

- (void) addManagedObject: (NSManagedObject *) managedObject{
    NSError *error;
    if(![managedObjectContext save:&error]){
        NSLog(@"Error = %@", [error userInfo]);
    }
    
}

- (void) removeManagedObject: (NSManagedObject *) managedObject{
    NSError *error;
    [managedObjectContext deleteObject:managedObject];
    if(![managedObjectContext save:&error]){
        NSLog(@"Error = %@", [error userInfo]);
    }
}

- (void) editManagedObject: (NSManagedObject *) managedObject{
    NSError *error;
    if(![managedObjectContext save:&error]){
        NSLog(@"Error = %@", [error userInfo]);
    }

}

@end