//
//  ViewController.swift
//  MZAccounts
//
//  Created by 祝海焜 on 15/12/27.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareOnSinaWeibo(sender: AnyObject) {
        
        let shareOnSinaWeibo : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo)
        
        self.presentViewController(shareOnSinaWeibo, animated: true, completion: nil)
        
    }


}

