//
//  ViewController.h
//  MZEmailer
//
//  Created by 祝海焜 on 15/12/21.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

- (IBAction)SendEmail:(id)sender;


- (IBAction)SendSMS:(id)sender;


- (IBAction)DialPhone:(id)sender;



@end

