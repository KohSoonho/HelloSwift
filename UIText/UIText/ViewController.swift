//
//  ViewController.swift
//  UIText
//
//  Created by Atsuhiro Kou on 2018/02/06.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// declare call delegate protocol
class ViewController: UIViewController, UITextFieldDelegate {
    // declare textfield property
    @IBOutlet weak var myText: UITextField!
    
    // declare label property
    @IBOutlet weak var mylabel: UILabel!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // if tap, hide keyboad
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set self to delegate property
        myText.delegate = self     // myText become delegate
    }
    
    // func of delegate method when text field is changed
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let tmpStr = textField.text! as NSString
        let replaceString = tmpStr.replacingCharacters(in: range, with: string)
        if replaceString == "" {
            // if chage empty, label display 0
            mylabel.text = "0"
        }else {
            if let num = Int(replaceString) {
                // label display value * 25
                mylabel.text = String(num * 25)
            }
        }
        // renewe textfield
        return true
    }
    
    // func of delegate method when push clear button
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        mylabel.text = "0"
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

