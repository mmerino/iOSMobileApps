//
//  ShowViewController.m
//  AddressBook
//
//  Created by Maria Merino on 7/22/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ShowViewController.h"
#import "EditViewController.h"
#import "Person.h"

@interface ShowViewController (){
    IBOutlet UILabel *firstNameLabel;
    IBOutlet UILabel *lastNameLabel;
    IBOutlet UILabel *emailLabel;
    IBOutlet UILabel *phoneLabel;
    EditViewController *editViewController;
}
- (IBAction)editButtonAction:(id)sender;

@end

@implementation ShowViewController

@synthesize delegate;
@synthesize person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Stuff
    }
    return self;
}

- (void)viewDidLoad
{
    firstNameLabel.text = person.firstName;
    lastNameLabel.text = person.lastName;
    emailLabel.text = person.emailAddress;
    phoneLabel.text = person.phoneNumber;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"toEditView" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem*)sender{
    
    if ([segue.identifier isEqualToString:@"toEditView"]) {
        editViewController = segue.destinationViewController;
        editViewController.person = person;
        editViewController.delegate = self;
    }
}
#pragma mark delegate
- (void) editRecord:(Person *)updatedPerson{
    firstNameLabel.text = updatedPerson.firstName;
    lastNameLabel.text = updatedPerson.lastName;
    emailLabel.text = updatedPerson.emailAddress;
    phoneLabel.text = updatedPerson.phoneNumber;
}

- (void) viewDidDisappear:(BOOL)animated{
    Person *duder = [[Person alloc]init];
    duder.firstName = firstNameLabel.text;
    duder.lastName = lastNameLabel.text;
    duder.emailAddress = emailLabel.text;
    duder.phoneNumber = phoneLabel.text;
    [delegate editRecord:duder];
}

@end
