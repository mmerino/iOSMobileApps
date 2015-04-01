//
//  EditViewController.m
//  AddressBook
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "EditViewController.h"
#import "CoreDataSingleton.h"

@interface EditViewController (){
    
    __weak IBOutlet UITextField *firstNameTextField;
    __weak IBOutlet UITextField *lastNameTextField;
    __weak IBOutlet UITextField *emailTextField;
    __weak IBOutlet UITextField *phoneTextField;
    NSManagedObjectContext *managedObjectContext;
}
- (IBAction)confirmButtonAction:(id)sender;

@end

@implementation EditViewController

@synthesize delegate;
@synthesize person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstNameTextField.text = person.firstName;
    lastNameTextField.text = person.lastName;
    emailTextField.text = person.emailAddress;
    phoneTextField.text = person.phoneNumber;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButtonAction:(id)sender {
    
    if (self.editAdd == YES) {
        //Add Person
        managedObjectContext = [[CoreDataSingleton sharedInstance]managedObjectContext];
        Person *editPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
        editPerson.firstName = firstNameTextField.text;
        editPerson.lastName = lastNameTextField.text;
        editPerson.emailAddress = emailTextField.text;
        editPerson.phoneNumber = phoneTextField.text;
        //[delegate editRecord:editPerson];
        
        //Method from Singleton HERE!
        [[CoreDataSingleton sharedInstance] addManagedObject:editPerson];
        
    } else{
        //Edit Person
        self.person.firstName = firstNameTextField.text;
        self.person.lastName = lastNameTextField.text;
        self.person.emailAddress = emailTextField.text;
        self.person.phoneNumber = phoneTextField.text;
        [delegate editRecord:self.person];
        //Method from Singleton HERE!
        [[CoreDataSingleton sharedInstance] editManagedObject:self.person];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
