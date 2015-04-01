//
//  SecondViewController.m
//  MMPersistanceScaffoldV3
//
//  Created by Maria Merino on 7/19/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController (){
    
    __weak IBOutlet UITextField *nameTextField;
    __weak IBOutlet UITextView *descriptionTextField;
}
- (IBAction)saveButtonAction:(id)sender;

@end

@implementation SecondViewController

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
    nameTextField.text = self.hero.name;
    descriptionTextField.text = self.hero.superDescription;
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonAction:(id)sender {
    NSManagedObjectContext *managedObjectContext = ((AppDelegate*) [UIApplication sharedApplication].delegate).managedObjectContext;
    NSError *error;
    
    self.hero.name = nameTextField.text;
    self.hero.superDescription = descriptionTextField.text;
    
    if (![ managedObjectContext save:&error]){
        NSLog(@"%@",error);
    }
    
[self.navigationController popViewControllerAnimated:YES];

}
@end
