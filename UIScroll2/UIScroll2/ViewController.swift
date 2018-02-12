//
//  ViewController.swift
//  UIScroll2
//
//  Created by Atsuhiro Kou on 2018/02/12.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myScroll: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet var myTextFields: [UITextField]!
    
    // editingTextField
    var editingField:UITextField?
    // duplicated height
    var overlap:CGFloat = 0.0
    var lastOffsetY:CGFloat = 0.0
    
    // Delegate method of bigining edit
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editingField = textField
    }
    
    // Delegate method of finishing edit
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingField = nil
    }
    
    // Delegate method input new line
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true) // set keyboad below
        // not input return command
        return false
    }
    
    // tap of view set keyboad below
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // when scroll, keyboad set below
        myScroll.keyboardDismissMode = .onDrag
        
        // set area of scrollview
        // y: 20 is under the status bar
        let scrollFrame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height-20)
        myScroll.frame = scrollFrame
        // set size of content
        let contentRect = contentView.bounds
        myScroll.contentSize = CGSize(width: contentRect.width, height: contentRect.height)
        
        // set delegate
        for fld in myTextFields {
            fld.delegate = self
        }
        
        // get default of notification
        let notification = NotificationCenter.default
        // change keyboad frame
        notification.addObserver(self, selector: #selector(ViewController.keyboadChangeFrame(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        // output keyboad
        notification.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        // delete keyboad
        notification.addObserver(self, selector: #selector(ViewController.keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }

    @objc func keyboadChangeFrame(_ notification: Notification) {
        guard let fld = editingField else {
            return
        }
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let fldFrame = view.convert(fld.frame, from: contentView)
        overlap = fldFrame.maxY - keyboardFrame.minY + 5
        if overlap > 0 {
            overlap += myScroll.contentOffset.y
            myScroll.setContentOffset(CGPoint(x: 0, y: overlap), animated: true)
        }
    }
        
    @objc func keyboardWillShow(_ notification: Notification) {
        lastOffsetY = myScroll.contentOffset.y
    }
        
    @objc func keyboardDidHide (_ notification: Notification) {
        myScroll.setContentOffset(CGPoint(x: 0, y: lastOffsetY), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

