//
//  ViewController.h
//  MZRegistrationForm
//
//  Created by 祝海焜 on 15/12/8.
//  Copyright © 2015年 Matin.Zhou. All rights reserved .
//

#import <UIKit/UIKit.h>
#import <sqlite3.h> 

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *EnterName;
@property (weak, nonatomic) IBOutlet UITextField *EnterEmail;
@property (weak, nonatomic) IBOutlet UITextField *EnterPhone;
@property (weak, nonatomic) IBOutlet UITextField *EnterCompany;
@property (weak, nonatomic) IBOutlet UITextField *EnterId;

- (IBAction)Submit:(id)sender;

// Save database path
@property (strong, nonatomic) NSString *databasePath;

// Contact database
@property (nonatomic) sqlite3 *contactDB;

@end

