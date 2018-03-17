//
//  ViewController.swift
//  UILabel
//
//  Created by Atsuhiro Kou on 2018/03/05.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Declaration of label's property (These have UILabel class)
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myLabel5: UILabel!
    @IBOutlet weak var myLabel6: UILabel!
    
    @IBOutlet weak var myLabel7: UILabel!
    @IBOutlet weak var myLabel8: UILabel!
    @IBOutlet weak var myLabel9: UILabel!
    
    @IBOutlet weak var myLabel10: UILabel!
    @IBOutlet weak var myLabel11: UILabel!
    @IBOutlet weak var myLabel12: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // price and number
        let price = 1000
        let number = 5
        
        // Set .text property of UILabel class.
        myLabel1.text = "price is \(price), number is \(number)."
        myLabel2.text = "\(price * number)"
        // UILabel.text is optional value, you need to unwrap.
        myLabel3.text = "Total price: " + myLabel2.text! + "."
        
        /* Alignment, text color and background color */
        myLabel4.text = "Left"
        myLabel5.text = "Center"
        myLabel6.text = "Right"
        
        // textAlignment is defined as enum, therefore access by .left/.center/.right
        myLabel4.textAlignment = .left
        myLabel5.textAlignment = .center
        myLabel6.textAlignment = .right
        
        // textColor and backGroundColor is set by UIColor class
        myLabel4.textColor = UIColor.blue
        myLabel5.textColor = UIColor.brown
        myLabel6.textColor = UIColor.cyan
        
        myLabel4.backgroundColor = UIColor.darkGray
        myLabel5.backgroundColor = UIColor.red
        myLabel6.backgroundColor = UIColor.yellow
        
        /* Line break */
        myLabel7.text = "Swift is very good programming language"
        myLabel8.text = myLabel7.text!
        myLabel9.text = myLabel7.text!
        
        // lineBreak set line break mode
        myLabel7.lineBreakMode = .byTruncatingTail   // display head
        myLabel8.lineBreakMode = .byTruncatingMiddle // display center
        myLabel9.lineBreakMode = .byTruncatingHead   // display tail
        
        /* Modify size of text */
        myLabel10.text = myLabel7.text!
        myLabel11.text = myLabel7.text!
        myLabel12.text = myLabel7.text!
        
        // adjustsFontSizeToFitWidth set AutoShrink method
        myLabel10.adjustsFontSizeToFitWidth = false  // do not autoshrink
        myLabel11.adjustsFontSizeToFitWidth = true   // do autoshrink
        myLabel12.adjustsFontSizeToFitWidth = true   // do autoshrink but, ...
        myLabel12.minimumScaleFactor = 0.8           // min font size is 80%
        
        /* Making Label by code */
        // make UILabel
        let myLabel = UILabel()
        myLabel.text = "Hellow Swift"
        myLabel.textColor = UIColor.white
        myLabel.backgroundColor = UIColor.blue
        
        // area of Label
        myLabel.frame = CGRect(x: 50, y: 50, width: 200, height: 21)
        
        // Add UILabel to View
        view.addSubview(myLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

