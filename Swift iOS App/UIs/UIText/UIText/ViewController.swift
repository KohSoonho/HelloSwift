//
//  ViewController.swift
//  UIText
//
//  Created by Atsuhiro Kou on 2018/03/19.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// apply UITextDelegate protocol
class ViewController: UIViewController, UITextFieldDelegate {
    // declaration of property of UIText
    @IBOutlet weak var myText: UITextField!
    
    // declaration of property of Label
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabel.backgroundColor = UIColor.gray
        myLabel.text = "0"
        
        // ViewController become delegate of myText
        myText.delegate = self
        
    }
    
    // Delegate method when edit text field
    // This method is done in ViewController
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // cast myText.text to NSString.
        // Note: NSString has some specific properties of methods.
        let tmpStr = myText.text! as NSString
        // .replacingCharacters is used only in NSString.
        // get present value as String.
        let replacedStr = tmpStr.replacingCharacters(in: range, with: string)
        
        if replacedStr == "" {
            myLabel.text = "0"
        } else {
            if let num = Int(replacedStr) {
                myLabel.text = String(25 * num)
            }
        }
        // renew text field
        return true
    }
    
    // Delegate method when clear text field
    // This method is done in ViewController
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel.text = "0"
        return true
    }
        
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // set keyboad when you finish editing
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

