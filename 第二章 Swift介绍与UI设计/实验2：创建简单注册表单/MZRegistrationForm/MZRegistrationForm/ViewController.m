//
//  ViewController.m
//  MZRegistrationForm
//
//  Created by 祝海焜 on 15/12/8.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TouchButton:(id)sender {
    // action on clickOnButton
    _EnterName.text = @"";
    _EnterEmail.text = @"";
    _EnterPhone.text = @"";
    _EnterCompany.text = @"";
    _EnterId.text = @"";
    _EnterAddress.text = @"";
}

- (IBAction)Submit:(id)sender {
    // Action when tap on background
    [self.view endEditing:YES];
}
@end
