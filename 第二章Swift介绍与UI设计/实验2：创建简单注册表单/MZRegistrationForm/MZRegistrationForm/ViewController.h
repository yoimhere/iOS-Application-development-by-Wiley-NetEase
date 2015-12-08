//
//  ViewController.h
//  MZRegistrationForm
//
//  Created by 祝海焜 on 15/12/8.
//  Copyright © 2015年 Matin.Zhou. All rights reserved .
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)TouchButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *EnterName;
@property (weak, nonatomic) IBOutlet UITextField *EnterEmail;
@property (weak, nonatomic) IBOutlet UITextField *EnterPhone;
@property (weak, nonatomic) IBOutlet UITextField *EnterCompany;
@property (weak, nonatomic) IBOutlet UITextField *EnterId;
@property (weak, nonatomic) IBOutlet UITextField *EnterAddress;
- (IBAction)Submit:(id)sender;

@end

