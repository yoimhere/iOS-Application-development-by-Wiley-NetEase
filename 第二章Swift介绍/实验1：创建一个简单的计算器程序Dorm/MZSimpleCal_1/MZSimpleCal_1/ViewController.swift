//
//  ViewController.swift
//  MZSimpleCal_1
//
//  Created by 祝海焜 on 15/12/8.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTyping = false
    var firstnum = 0
    var secondnum = 0
    var result = 0
    var operation = ""
    
    @IBOutlet weak var OutScreen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func calButton(sender: AnyObject) {
        let number = sender.currentTitle
        if isTyping {
            OutScreen.text = OutScreen.text! + number!!
        } else {
            OutScreen.text = number
            isTyping = true
        }
    }
   
    @IBAction func Clear(sender: AnyObject) {
        firstnum = 0
        secondnum = 0
        operation = ""
        isTyping = false
        result = 0
        OutScreen.text = "\(result)"
    }
    
    @IBAction func operation(sender: AnyObject) {
        isTyping = false
            
        //之前代码为firstnum = OutScreen.text!.toInt()!，现在Swift为2.0版本，语法变化
        firstnum = Int(OutScreen.text!)!
        
        operation = sender.currentTitle!!
        print(operation)
    }
    
    @IBAction func equal(sender: AnyObject) {
        
        //之前代码为secondnum = OutScreen.text!.toInt()!，现在Swift为2.0版本，语法变化
        secondnum = Int(OutScreen.text!)!
        
        isTyping = false
        
        if (operation == "+")
        {  result = firstnum + secondnum
            OutScreen.text = "\(result)"
            print(result)}
            
            else if (operation == "-" )
        {   result = firstnum - secondnum
            OutScreen.text = "\(result)"
            print(result) }
            
            else if (operation == "x")
        {  result = firstnum * secondnum
            OutScreen.text = "\(result)"
            print(result)}
            
            else if (operation == "/")
        {   result = firstnum / secondnum
            OutScreen.text = "\(result)"
            print(result)
        }
    }

}

