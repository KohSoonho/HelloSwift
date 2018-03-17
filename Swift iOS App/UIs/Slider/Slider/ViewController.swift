//
//  ViewController.swift
//  Slider
//
//  Created by Atsuhiro Kou on 2018/03/13.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* UIStepper */
    ////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var myLabel: UILabel!
    // Acction connect by Stepper
    @IBAction func Stepper(_ sender: UIStepper) {
        // Get value by sender.value
        let num = Int(sender.value)  // sender.value is double type
        // Set value to text
        myLabel.text = String(num)
        
    }
    @IBOutlet weak var StepperOutlet: UIStepper!
    
    @IBOutlet weak var myLabel2: UILabel!
    // Acction connect by Any
    @IBAction func Stepper2(_ sender: Any) {
        // Cast UIStepper type
        let stepper = sender as! UIStepper
        let num2 = Int(stepper.value)
        myLabel2.text = String(num2)
    }
    @IBOutlet weak var StepperOutlet2: UIStepper!
    
    ////////////////////////////////////////////////////////////////////////////
    
    /* UISwitch */
    ////////////////////////////////////////////////////////////////////////////
    @IBOutlet weak var myLabel3: UILabel!
    
    // The func which is called by UISwitch
    @IBAction func showHide(_ sender: UISwitch) {
        // On -> isHidden = false, Off -> is.Hidden = true
        myLabel3.isHidden = !sender.isOn   // ! mean "not"
    }
    ////////////////////////////////////////////////////////////////////////////
    
    /* UISegmentedControl */
    ////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var colorChip: UIView!
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex /* get index of selected segment */ {
        case 0:
            colorChip.backgroundColor = UIColor.blue
        case 1:
            colorChip.backgroundColor = UIColor.red
        case 2:
            colorChip.backgroundColor = UIColor.yellow
        case 3:
            colorChip.backgroundColor = UIColor.green
        default:
            colorChip.backgroundColor = UIColor.blue
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////
    
    /* UISlider */
    ////////////////////////////////////////////////////////////////////////////
    
    @IBOutlet weak var Swift: UIImageView!
    
    @IBAction func changeSlider(_ sender: UISlider) {
        // set slider value to alpha value
        Swift.alpha = CGFloat(sender.value)
    }
    
    ////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.text = "0"
        myLabel.backgroundColor = UIColor.gray
        myLabel2.text = "10"
        myLabel2.backgroundColor = UIColor.gray
        
        /* Stepper property */
        ////////////////////////////////////////////////////////////////////////
        
        StepperOutlet.minimumValue = 0.0
        StepperOutlet.maximumValue = 100.0
        StepperOutlet.stepValue = 1.0
        StepperOutlet.autorepeat = true
        
        StepperOutlet2.minimumValue = 10.0
        StepperOutlet2.maximumValue = 30.0
        StepperOutlet2.stepValue = 2.0
        StepperOutlet2.autorepeat = false
        
        ////////////////////////////////////////////////////////////////////////
        
        myLabel3.text = "Hello! Swift"
        myLabel3.backgroundColor = UIColor.gray
        
        Swift.alpha = CGFloat(0.5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

