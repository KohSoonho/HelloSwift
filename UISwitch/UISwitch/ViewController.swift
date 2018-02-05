//
//  ViewController.swift
//  UISwitch
//
//  Created by Atsuhiro Kou on 2018/02/04.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // declare property of Label
    @IBOutlet weak var numLabel: UILabel!
    
    // method of stepper
    @IBAction func changeValue(_ sender: UIStepper) {
        let num = Int(sender.value)   // get stepper value
        numLabel.text = String(num)   // assign value to label text
    }
    
    // declare property of Label
    @IBOutlet weak var helloLabel: UILabel!
    
    // method of switch
    @IBAction func showhide(_ sender: UISwitch) {
        helloLabel.isHidden = !sender.isOn  // Hide label if switch is not On
    }
    
    // declare property of view
    @IBOutlet weak var colorView: UIView!
    
    // method of segment control
    @IBAction func colorChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {  // get number of UISegmented
        case 0:
            colorView.backgroundColor = UIColor.blue
        case 1:
            colorView.backgroundColor = UIColor.yellow
        case 2:
            colorView.backgroundColor = UIColor.green
        default:
            colorView.backgroundColor = UIColor.blue
        }
    }
    
    // declare property of image
    @IBOutlet weak var SwiftImage: UIImageView!
    
    // method of slider
    @IBAction func SwiftSlider(_ sender: UISlider) {
        SwiftImage.alpha = CGFloat(sender.value)  // assign image.alpha to slider value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

