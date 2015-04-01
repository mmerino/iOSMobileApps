//
//  ViewController.m
//  BlockCalculator
//
//  Created by Maria Merino on 7/23/13.
//  Copyright (c) 2013 Maria Merino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UITextField *textField1;
    __weak IBOutlet UITextField *textField2;
    __weak IBOutlet UILabel *label;
    __weak IBOutlet UILabel *firstNumberLabel;
    __weak IBOutlet UILabel *secondNumberLabel;
    __weak IBOutlet UILabel *operand;
}
- (IBAction)calculate:(id)sender;

@end

//typedef NSInteger (^mathType) (NSInteger, NSInteger);
//mathType add = ^(NSInteger int1, NSInteger int2){return int1 + int2;};
//mathType subtract = ^(NSInteger int1, NSInteger int2){return int1 - int2;};
//NSInteger (^add) (NSInteger, NSInteger) = ^(NSInteger int1, NSInteger int2){return int1 + int2;};

/*
NSInteger add(int int1, int int2){
    return int1 + int2;
}
*/

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)calculateNumber:(NSInteger) int1 toNumber:(NSInteger) int2 usingBlock: (NSInteger (^) (NSInteger, NSInteger)) mathBlock{
    return mathBlock(int1, int2);
}

- (IBAction)calculate:(UIButton*)sender {
    NSInteger newNumber;
    firstNumberLabel.text = textField1.text;
    secondNumberLabel.text = textField2.text;
    //mathType block;
    //NSInteger newNumber = add(textField1.text.intValue, textField2.text.intValue);
    //NSInteger newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue];
    if (sender.tag == 0){
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
            return int1+int2;
        }];
        operand.text = @"+";
    } else if (sender.tag == 1){
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
            return int1-int2;
        }];
        operand.text = @"-";
    } else if (sender.tag == 2){
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
            return int1*int2;
        }];
        operand.text = @"x";
    } else {
        newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:^NSInteger (NSInteger int1, NSInteger int2){
            return int1/int2;
        }];
        operand.text = @"/";
    }
   /*
    [UIView animateWithDuration:1.0 animations:^{
        self.view.backgroundColor = [UIColor orangeColor];
    }completion:^(BOOL finished) {
        NSLog(@"animation finished");
    }];
    */
    //NSInteger newNumber = [self calculateNumber:textField1.text.intValue toNumber:textField2.text.intValue usingBlock:block];
label.text = [NSString stringWithFormat:@" =  %i",newNumber];

}
@end
