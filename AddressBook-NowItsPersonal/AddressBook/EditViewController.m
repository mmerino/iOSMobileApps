//
//  EditViewController.m
//  AddressBook
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController (){
    
    __weak IBOutlet UITextField *firstNameTextField;
    __weak IBOutlet UITextField *lastNameTextField;
    __weak IBOutlet UITextField *emailTextField;
    __weak IBOutlet UITextField *phoneTextField;
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
    Person *editPerson = [[Person alloc] init];
    editPerson.firstName = firstNameTextField.text;
    editPerson.lastName = lastNameTextField.text;
    editPerson.emailAddress = emailTextField.text;
    editPerson.phoneNumber = phoneTextField.text;
    [delegate editRecord:editPerson];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
