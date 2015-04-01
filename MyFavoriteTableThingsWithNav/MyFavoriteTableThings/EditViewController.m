//
//  EditViewController.m
//  MyFavoriteTableThingsWithNav
//
//  Created by Maria Merino on 7/16/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "EditViewController.h"

@interface EditViewController (){
    
    __weak IBOutlet UITextField *editViewTextField;
}
- (IBAction)editButtonAction:(id)sender;

@end

@implementation EditViewController

@synthesize textValue;
@synthesize delegate;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editButtonAction:(id)sender {
    [delegate valueDidChange:editViewTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
