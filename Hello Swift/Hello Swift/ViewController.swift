//
//  ViewController.swift
//  Hello Swift
//
//  Created by Atsuhiro Kou on 2018/01/29.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapGreen(_ sender: UIButton) {
        view.backgroundColor = UIColor.green
    }
    
    @IBAction func tapWhite(_ sender: UIButton) {
        view.backgroundColor = UIColor.white
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

