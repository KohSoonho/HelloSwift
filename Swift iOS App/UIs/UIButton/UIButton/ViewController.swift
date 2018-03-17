//
//  ViewController.swift
//  UIButton
//
//  Created by Atsuhiro Kou on 2018/03/06.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// Define image name
let swift = UIImage(named: "swift-og")
let CLanguage = UIImage(named: "Image")
let CPP = UIImage(named: "Image-1")

class ViewController: UIViewController {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var CLang: UILabel!
    
    // Layout of button is controled by outlet connection.
    @IBOutlet weak var random: UIButton!
    @IBOutlet weak var OK: UIButton!
    
    @IBOutlet weak var image2: UIButton!
    
    // Action of button is controled by action connection.
    @IBAction func tapRandom(_ sender: Any) {
        // make random number
        let num = arc4random_uniform(100)
        result.text = ""
        number.text = String(num)
        
        // if num >= 70, result button is done.
        OK.isEnabled = (num >= 70)
    }
    
    @IBAction func tapOK(_ sender: Any) {
        result.text = "You pass the test!"
    }
    
    @IBAction func tapImage2(_ sender: Any) {
        two.text = (two.text == "") ? "Swift!" : ""
    }
    
    // define method of button
    @objc func tapC(_ sender:UIButton) {
        CLang.text = (CLang.text == "") ? "C and CPP" : ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        number.text = "0"
        result.text = ""
        two.text = ""
        CLang.text = ""
        
        // Button's title, title color and background color
        random.setTitle("Random", for: .normal)
        random.setTitleColor(UIColor.green, for: .normal)
        random.backgroundColor = UIColor.white
        
        OK.setTitle("OK", for: .normal)           // text at normal
        OK.setTitle("Yeah!", for: .highlighted)   // text at highlighted
        OK.setTitleColor(UIColor.white, for: .normal)
        OK.backgroundColor = UIColor.cyan
        
        // button's shape
        OK.layer.cornerRadius = 10.0
        
        // background image
        image2.setTitle("Swift", for: .normal)
        image2.setBackgroundImage(swift, for: .normal)
        
        // When you use setImage, you make UIButtonType.custom.
        // buttonType is read-only, so you set buttonType when do init.
        let CAndCpp = UIButton(type: .custom)
        
        // set area of button
        CAndCpp.frame = CGRect(x: 20, y: 20, width: 200, height: 60)

        // set image
        CAndCpp.setImage(CLanguage, for: .normal)  // image at normal
        CAndCpp.setImage(CPP, for: .highlighted)   // image at highlighted
        
        // set title
        CAndCpp.setTitle("C language", for: .normal)
        CAndCpp.setTitle("C++", for: .highlighted)
        CAndCpp.setTitleColor(UIColor.black, for: .normal)
        
        // connect action
        CAndCpp.addTarget(self, action: #selector(ViewController.tapC(_:)),
                          for: UIControlEvents.touchUpInside)
        // Add View
        self.view.addSubview(CAndCpp)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

