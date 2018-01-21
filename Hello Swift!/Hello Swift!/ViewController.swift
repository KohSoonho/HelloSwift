//
//  ViewController.swift
//  Hello Swift!
//
//  Created by Atsuhiro Kou on 2018/01/21.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            let lblhello = UILabel(frame: CGRect(x: 150, y:100, width: 200, height: 50))
            lblhello.text = "Hello Swift!"
            
            self.view.addSubview(lblhello)
            //Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
}
    


