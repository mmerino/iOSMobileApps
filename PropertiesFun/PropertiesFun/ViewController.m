//
//  ViewController.m
//  PropertiesFun
//
//  Created by Maria Merino on 7/12/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.


#import "ViewController.h"
#import "Person.h"

@interface ViewController (){
    
    __weak IBOutlet UILabel *nameLabel;
    
    __weak IBOutlet UILabel *name2Label;
    
    __weak IBOutlet UILabel *name3Label;
    
    __weak IBOutlet UITextField *nameTextField;
    
    
    Person *firstPerson;
    Person *secondPerson;
    Person *thirdPerson;
    
}
- (IBAction)change:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    firstPerson = [[Person alloc]init];
    firstPerson.name = @"First";
    nameLabel.text = firstPerson.name;
    
    secondPerson = [[Person alloc]init];
    [secondPerson setName: @"Second"];
    [name2Label setText:[secondPerson name]];
    
    thirdPerson = [[Person alloc]init];
    thirdPerson.name = @"Third";
    name3Label.text = thirdPerson.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(UIButton *)sender {
    if (sender.tag == 1){
        name2Label.text = nameTextField.text;
    }else if (sender.tag == 2){
        nameLabel.text = nameTextField.text;
    }else{
        name3Label.text = nameTextField.text;
    }
}
@end
