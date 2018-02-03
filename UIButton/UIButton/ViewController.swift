//
//  ViewController.swift
//  UIButton
//
//  Created by Atsuhiro Kou on 2018/02/03.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var OK: UIButton!
    
    @IBAction func random(_ sender: Any) {
        // make random number
        let num = arc4random_uniform(100)
        number.text = String(num)
        
        // if num >= 50, OK button is enable
        // if num <  50, OK button is unable
        OK.isEnabled = (num >= 50) // num >= 50: true/num < 50: false
    }
    
    @IBAction func tapOK(_ sender: Any) {
        print("OK")
    }
    
    // define method of button
    @objc func ok(_ sender: UIButton) {
        print("OK")
    }
    
    @objc func hello(_ sender: UIButton) {
        print("hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        OK.layer.masksToBounds = true
        OK.layer.cornerRadius = 20.0
        OK.backgroundColor = UIColor.red
        
        // make button
        let OKButton = UIButton()
        // area
        OKButton.frame = CGRect(x: 200, y: 100, width: 120, height: 120)
        // image of background
        let bkgImage = UIImage(named: "swift-og")
        OKButton.setBackgroundImage(bkgImage, for: .normal)
        // title of button
        OKButton.setTitle("OK", for: .normal)
        OKButton.setTitleColor(UIColor.red, for: .normal)
        // method of button
        OKButton.addTarget(self, action: #selector(ViewController.ok(_:)), for: UIControlEvents.touchUpInside)
        //add view
        view.addSubview(OKButton)
        
        // make button
        let myButton = UIButton(type: .custom)  // custom type
        // area
        myButton.frame = CGRect(x: 200, y: 300, width: 120, height: 50)
        // image of button
        let image1 = UIImage(named: "images-1")       // image of normal
        let image2 = UIImage(named: "images")         // image of hidhlighted
        myButton.setImage(image1, for: .normal)
        myButton.setImage(image2, for: .highlighted)
        // title
        myButton.setTitle("Hello", for: .normal)
        myButton.setTitleColor(UIColor.blue, for: .normal)
        // method
        myButton.addTarget(self, action: #selector(ViewController.hello(_:)), for: UIControlEvents.touchUpInside)
        
        // add to view
        self.view.addSubview(myButton)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

