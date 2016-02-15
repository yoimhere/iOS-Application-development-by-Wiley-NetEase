//
//  ViewController.m
//  MZEmailer
//
//  Created by 祝海焜 on 15/12/21.
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

- (IBAction)SendEmail:(id)sender {
    
    // Email主题
    NSString *eSub = @"Test Email";
    // Email内容
    NSString *mBody = @"M9d3 EMailer app";
    // Email收件人
    NSArray *recipients = [NSArray arrayWithObject:@"john@gmail.com"];
    
    MFMailComposeViewController *Ecomp = [[MFMailComposeViewController alloc] init];
    Ecomp.mailComposeDelegate = self;
    [Ecomp setSubject:eSub];
    [Ecomp setMessageBody:mBody isHTML:YES];
    [Ecomp setToRecipients:recipients];
    // 使mail界面显示在屏幕上
    [self presentViewController:Ecomp animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller
           didFinishWithResult:(MFMailComposeResult)result
                         error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // 关闭mail界面
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)SendSMS:(id)sender {
    
    MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] self];
    if([MFMessageComposeViewController canSendText])
        {
        //设置短信内容
        controller.body = @"This is Test SMS from Emailer app.";
        //设置短信接收号码
        controller.recipients = [NSArray arrayWithObjects:@"12345678", nil];
        controller.messageComposeDelegate = self;
    
        [self presentViewController:controller animated:YES completion:nil];
    }
    }

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result
    {
        switch (result) {
            case MessageComposeResultCancelled:
                //测试，点击取消时打印如下内容
                NSLog(@"Cancelled");
                break;
            case MessageComposeResultSent:
                //测试，点击发送时打印如下内容
                NSLog(@"Message sent");
                break;
            default:
                break;
    }
        [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)DialPhone:(id)sender{
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:+8612345678"]];

}



@end
