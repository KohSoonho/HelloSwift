//
//  ViewController.swift
//  UIScrollByKeyboad
//
//  Created by Atsuhiro Kou on 2018/04/08.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Scroll View
    @IBOutlet weak var MyScrollView: UIScrollView!
    
    // SubView
    @IBOutlet weak var ContentView: UIView!
    
    // The array of textFields
    @IBOutlet var myTextFields: [UITextField]!
    
    // Close keyboard by tap
    @IBAction func tapView(_ sender: Any) {
        // Close keyboard
        view.endEditing(true)
    }
    
    /* Find editing text */
    /* Delegate method of text fields */
    ///////////////////////////////////////////////////////////////////
    
    // Editing textField
    var editingField:UITextField?
    
    // Begin to edit
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Set editting text
        editingField = textField
    }
    
    // Finish to edit
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Finish editing text
        editingField = nil
    }
    
    // Input "return", finish to edit
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // close keyboard
        view.endEditing(true)
        return false
    }
    
    ////////////////////////////////////////////////////////////////////
    
    // Stucking height
    var overlap:CGFloat = 0.0
    var lastOffsetY:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Close keyboard by swipe
        MyScrollView.keyboardDismissMode = .onDrag
        
        // Define area of scrollView
        let scrollFrame = CGRect(x: 0, y:20, width: view.frame.width, height: view.frame.height - 20)
        MyScrollView.frame = scrollFrame
        
        // Define size of contentView
        let contentRect = ContentView.bounds
        MyScrollView.contentSize = CGSize(width: contentRect.width, height: contentRect.height)
        
        // All textFields delegates ViewController
        for fld in myTextFields {
            fld.delegate = self
        }
        
        /* Make notification center */
        ////////////////////////////////////////////////////////////
        
        // Get default notification center
        let notification = NotificationCenter.default
        
        // Change keyboardFrame
        notification.addObserver(self, selector: #selector(ViewController.keyboardChangeFrame(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        
        // Open keyboard
        notification.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // Close keyboard
        notification.addObserver(self, selector: #selector(ViewController.keyboardDidHide(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        ////////////////////////////////////////////////////////////
    }
    
    // Function when receive notification of keyboardChangeFrame
    @objc func keyboardChangeFrame(_ notification: Notification) {
        // If editing text is nil, stop func
        guard let fld = editingField else {
            return
        }
        
        // Check keyboard's frame
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        // Convert coordinate of text in subView
        let fldFrame = view.convert(fld.frame, from: ContentView)
        
        // Check whether keyboard stack on text or not
        overlap = fldFrame.maxY - keyboardFrame.minY + 5
        if overlap > 0 {
            //
            overlap += MyScrollView.contentOffset.y
            MyScrollView.setContentOffset(CGPoint(x: 0, y: overlap), animated: true)
        }
    }
    
    // Function when receive notification of keyboardWillShow
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        lastOffsetY = MyScrollView.contentOffset.y
    }
    
    // Function when receive notification of keyboardDidHide
    @objc func keyboardDidHide(_ notification: Notification) {
        MyScrollView.setContentOffset(CGPoint(x: 0, y: lastOffsetY), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

