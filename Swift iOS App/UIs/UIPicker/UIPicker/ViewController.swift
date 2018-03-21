//
//  ViewController.swift
//  UIPicker
//
//  Created by Atsuhiro Kou on 2018/03/21.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// apply UIPickerView Delegate and UIPickerViewDataSource protocol
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var Row1: UILabel!
    
    @IBOutlet weak var Row2: UILabel!
    
    @IBOutlet weak var Item1: UILabel!
    
    @IBOutlet weak var Item2: UILabel!
    
    // deleration of PickerView property
    @IBOutlet weak var myPicker: UIPickerView!
    
    // define component
    let compos = [["1999", "2003", "2005", "2007", "2014"], ["Round1", "WCSF", "WCF", "final"]]
    
    // These function must be defined
    // define the number of components in PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return compos.count
        // It return 2, and 2 components are made.
    }
    
    // define the number of lines in each components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = compos[component]  // extract values of array
        return compo.count
    }
    
    // define the width of PickerView
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            // The width of first component is 100.
            return 100
        } else {
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = compos[component][row]  // extract each elements
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // selected rows
        let row1 = pickerView.selectedRow(inComponent: 0)  // the row of first component
        let row2 = pickerView.selectedRow(inComponent: 1)  // the row of second component
        
        Row1.text = String(row1)
        Row2.text = String(row2)
        
        // selected items
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        
        Item1.text = item1
        Item2.text = item2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Picker delegate ViewController
        myPicker.delegate = self
        // Picker data soruce delegate ViewController
        myPicker.dataSource = self
        
        Row1.text = String(myPicker.selectedRow(inComponent: 0))
        Row2.text = String(myPicker.selectedRow(inComponent: 1))
        
        Item1.text = self.pickerView(myPicker, titleForRow: 0, forComponent: 0)
        Item2.text = self.pickerView(myPicker, titleForRow: 0, forComponent: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

