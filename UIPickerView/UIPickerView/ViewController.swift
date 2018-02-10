//
//  ViewController.swift
//  UIPickerView
//
//  Created by Atsuhiro Kou on 2018/02/06.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var myPicker: UIPickerView!
    let compos = [["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], ["morning", "afternoon", "night"]]
    
    // return number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
    }
    
    // return number of lines in components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]
        return compo.count
    }
    
    // define width of pickerview
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {     // first component
            // Mon - Sun
            return 50
        } else {
            // Time Line
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = compos[component][row] // extract values from array
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = compos[component][row]
        print("select \(item)")
        
        // selected line number
        let row1 = pickerView.selectedRow(inComponent: 0)  // first component
        let row2 = pickerView.selectedRow(inComponent: 1)  // second component
        print("select number is \(row1, row2)")
        
        // selected item
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        print("now select \(item1!, item2!)")
        print("----------------")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set delegate
        myPicker.delegate = self
        myPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

