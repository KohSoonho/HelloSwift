//
//  ViewController.swift
//  Assistant Editor
//
//  Created by Atsuhiro Kou on 2018/02/03.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // declare property of UILabel
    @IBOutlet weak var myLabel1: UILabel!
    // text is optional, so need to unwrap by UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myLabel5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // the price and the number
        let price = 120
        let number = 4
        
        // display text of label
        myLabel1.text = "price: \(price), number: \(number)"
        // UILabel.text is String
        myLabel2.text = String(price * number)
        // to access text add "!" (UILabel.text is optional)
        myLabel3.text = "total price: " + myLabel2.text! + "yen"
        
        // allignment of text
        myLabel1.textAlignment = .left
        myLabel2.textAlignment = .center
        myLabel3.textAlignment = .right
        
        // color of text and background
        myLabel1.textColor = UIColor.red
        myLabel2.backgroundColor = UIColor.green
        
        // linebreak mode
        // linebreak mode can be changed by GUI
        // if change linebreak mode by code, change lineBreakMode property
        myLabel4.lineBreakMode = .byTruncatingMiddle
        
        // AutoShrink is set by GUI
        // if set by code, change adjustsFontSizeToFitWidth
        myLabel5.adjustsFontSizeToFitWidth = true
        
        // making label by code
        let myLabel6 = UILabel()
        myLabel6.text = "Hello! Swift!"
        // area of label
        myLabel6.frame = CGRect(x:50, y:300, width: 200, height: 21)
        myLabel6.textColor = UIColor.blue
        myLabel6.backgroundColor = UIColor.green
        
        // add View
        view.addSubview(myLabel6)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

